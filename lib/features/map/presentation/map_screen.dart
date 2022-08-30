import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/map/presentation/blocs/map_controller_bloc/map_controller_bloc.dart';
import 'package:anatomica/features/map/presentation/screens/hospital_list.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_bottom_sheet.dart';
import 'package:anatomica/features/map/presentation/widgets/map_button.dart';
import 'package:anatomica/features/map/presentation/widgets/map_controller_buttons.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late YandexMapController _mapController;
  late TabController _controller;
  late TextEditingController _searchFieldController;
  final List<MapObject<dynamic>> _mapObjects = [];

  double latitude = 0;
  double longitude = 0;
  final clusterId = const MapObjectId('big_cluster_id');

  Future<Uint8List> getBytesFromCanvas(
      {required int width,
      required int height,
      required int placeCount}) async {
    final pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.red;
    canvas.drawImage(await getImageInfo(context).then((value) => value.image),
        const Offset(0, 3), paint);
    TextPainter painter = TextPainter(textDirection: ui.TextDirection.ltr);
    painter.text = TextSpan(
      text: placeCount.toString(),
      style: const TextStyle(fontSize: 25.0, color: Colors.white),
    );
    painter.layout();
    painter.paint(
        canvas,
        Offset((width * 0.5) - painter.width * 0.5,
            (height * 0.5) - painter.height * 0.5));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data?.buffer.asUint8List() ?? Uint8List(0);
  }

  Future<ImageInfo> getImageInfo(BuildContext context) async {
    AssetImage assetImage = const AssetImage(AppImages.placeMarkCluster);
    ImageStream stream =
        assetImage.resolve(createLocalImageConfiguration(context));
    Completer<ImageInfo> completer = Completer();
    stream.addListener(ImageStreamListener((ImageInfo imageInfo, _) {
      return completer.complete(imageInfo);
    }));
    return completer.future;
  }

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _searchFieldController = TextEditingController();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  void addHospitals(List<Point> points) {
    final placeMarks = points
        .map(
          (e) => PlacemarkMapObject(
              opacity: 1,
              mapId: MapObjectId(e.latitude.toString()),
              point: e,
              onTap: (object, point) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useRootNavigator: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const HospitalSingleBottomSheet(),
                );
              },
              icon: PlacemarkIcon.single(PlacemarkIconStyle(
                  image:
                      BitmapDescriptor.fromAssetImage(AppImages.placeMarkIcon),
                  scale: 3))),
        )
        .toList();
    final clusterItem = ClusterizedPlacemarkCollection(
      mapId: clusterId,
      placemarks: placeMarks,
      radius: 25,
      minZoom: 30,
      onClusterAdded: (collection, cluster) async => cluster.copyWith(
        appearance: cluster.appearance.copyWith(
          opacity: 1,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromBytes(
                await getBytesFromCanvas(
                    width: 48,
                    height: 50,
                    placeCount: cluster.placemarks.length),
              ),
              scale: 3,
            ),
          ),
        ),
      ),
    );
    _mapObjects.clear();
    _mapObjects.add(clusterItem);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapControllerBloc()..add(GetPoints()),
      child: WKeyboardDismisser(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 64,
            titleSpacing: 16,
            title: SvgPicture.asset(
              AppIcons.mainLogo,
              height: 20,
            ),
          ),
          body: Builder(builder: (context) {
            return BlocConsumer<MapControllerBloc, MapControllerState>(
              listener: (context, state) {
                addHospitals(state.points);
              },
              builder: (context, state) {
                return Stack(
                  children: [
                    Positioned.fill(
                      bottom: 60,
                      child: YandexMap(
                        rotateGesturesEnabled: false,
                        onCameraPositionChanged:
                            (cameraPosition, updateReason, _) {},
                        onMapTap: (point) {
                          WidgetsBinding.instance.focusManager.primaryFocus
                              ?.unfocus();
                        },
                        mapObjects: _mapObjects,
                        onMapCreated: (controller) async {
                          _mapController = controller;
                          final position = await _determinePosition();
                          _mapController.moveCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: Point(
                                    latitude: position.latitude,
                                    longitude: position.longitude),
                              ),
                            ),
                            animation: const MapAnimation(
                                duration: 0.15, type: MapAnimationType.smooth),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      top: 16,
                      child: Container(
                        height: 36,
                        decoration: BoxDecoration(
                          color: textFieldColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: TabBar(
                          controller: _controller,
                          padding: EdgeInsets.zero,
                          indicatorPadding: EdgeInsets.zero,
                          indicator: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          labelPadding: EdgeInsets.zero,
                          labelStyle: Theme.of(context).textTheme.headline3,
                          labelColor: textColor,
                          onTap: (index) {
                            print(
                                'something from user: ${context.read<AuthenticationBloc>().state.user.img.small}');
                            if (index == 1) {
                              context
                                  .read<MapControllerBloc>()
                                  .add(GetDoctorPoints());
                            } else {
                              context
                                  .read<MapControllerBloc>()
                                  .add(GetPoints());
                            }
                          },
                          unselectedLabelColor: textSecondary,
                          tabs: [
                            Tab(text: LocaleKeys.organization.tr()),
                            Tab(text: LocaleKeys.doctor.tr()),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: MediaQuery.of(context).padding.bottom - 28,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MapButton.defaultButton(
                                  title: LocaleKeys.list.tr(),
                                  onTap: () => Navigator.of(context).push(
                                    fade(
                                      page: HospitalList(
                                        controller: _controller,
                                      ),
                                    ),
                                  ),
                                ),
                                MapControllerButtons(
                                  onCurrentLocationTap: () async {
                                    final position = await _determinePosition();
                                    _mapController.moveCamera(
                                      CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                          target: Point(
                                              latitude: position.latitude,
                                              longitude: position.longitude),
                                        ),
                                      ),
                                      animation: const MapAnimation(
                                          duration: 0.15,
                                          type: MapAnimationType.smooth),
                                    );
                                  },
                                  onMinusTap: () {
                                    _mapController.moveCamera(
                                      CameraUpdate.zoomOut(),
                                      animation: const MapAnimation(
                                          duration: 0.15,
                                          type: MapAnimationType.smooth),
                                    );
                                  },
                                  onPlusTap: () {
                                    _mapController.moveCamera(
                                      CameraUpdate.zoomIn(),
                                      animation: const MapAnimation(
                                          duration: 0.15,
                                          type: MapAnimationType.smooth),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 36,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 12),
                              physics: const BouncingScrollPhysics(),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemBuilder: (context, index) => MapButton.chip(
                                  title: 'Стомотология',
                                  onTap: () {
                                    Navigator.of(context).push(
                                      fade(
                                        page: HospitalList(
                                          controller: _controller,
                                        ),
                                      ),
                                    );
                                  }),
                              itemCount: 10,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.fromLTRB(16, 16, 16,
                                MediaQuery.of(context).viewInsets.bottom + 43),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: textFieldColor),
                              color: white,
                            ),
                            child: SearchField(
                              controller: _searchFieldController,
                              onChanged: (value) {},
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          }),
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
