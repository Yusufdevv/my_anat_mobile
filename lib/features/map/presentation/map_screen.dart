import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/map/domain/entities/map_parameter.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_doctors.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_hospitals.dart';
import 'package:anatomica/features/map/domain/usecases/get_specialization.dart';
import 'package:anatomica/features/map/domain/usecases/get_types_usecase.dart';
import 'package:anatomica/features/map/presentation/blocs/map_controller_bloc/map_controller_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/specialization/specialization_bloc.dart';
import 'package:anatomica/features/map/presentation/screens/hospital_list.dart';
import 'package:anatomica/features/map/presentation/screens/suggestion/suggestion_page.dart';
import 'package:anatomica/features/map/presentation/widgets/map_button.dart';
import 'package:anatomica/features/map/presentation/widgets/map_controller_buttons.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

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
  late MapOrganizationBloc mapOrganizationBloc;
  late SpecializationBloc specBloc;

  double latitude = 0;
  double longitude = 0;
  double zoomLevel = 15;
  int currentRadius = 100000;
  double maxZoomLevel = 0;
  double minZoomLevel = 0;

  @override
  void initState() {
    specBloc = SpecializationBloc(GetSpecializationUseCase())
      ..add(SpecializationEvent.getSpecs());
    mapOrganizationBloc = MapOrganizationBloc(
      GetMapHospitalUseCase(),
      GetMapDoctorUseCase(),
      getTypesUseCase:
          GetTypesUseCase(repository: serviceLocator<MapRepositoryImpl>()),
    );
    _controller = TabController(length: 2, vsync: this);
    _searchFieldController = TextEditingController();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapControllerBloc()..add(GetPoints()),
        ),
        BlocProvider.value(
          value: mapOrganizationBloc,
        ),
        BlocProvider.value(
          value: specBloc,
        ),
      ],
      child: WKeyboardDismisser(
        child: Scaffold(
          // appBar: AppBar(
          //   systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          //   elevation: 0,
          //   toolbarHeight: 64,
          //   titleSpacing: 16,
          //   title: SvgPicture.asset(
          //     AppIcons.mainLogo,
          //     height: 20,
          //   ),
          // ),
          body: BlocConsumer<MapOrganizationBloc, MapOrganizationState>(
            listenWhen: (state1, state2) {
              bool isBuild =
                  (state1.hospitals.length != state2.hospitals.length) ||
                      (state1.doctors.length != state2.doctors.length);
              return isBuild;
            },
            listener: (context, state) {
              setState(() {
                if (_controller.index == 0) {
                  MyFunctions.addHospitals(
                      state.hospitals, context, _mapObjects);
                } else {
                  MyFunctions.addDoctors(state.doctors, context, _mapObjects);
                }
              });
            },
            builder: (context, mapOrganizationState) => Stack(
              children: [
                BlocListener<SpecializationBloc, SpecializationState>(
                  listenWhen: (state1, state2) {
                    return state1.selectedId != state2.selectedId;
                  },
                  listener: (context, state) {
                    mapOrganizationBloc.add(MapOrganizationEvent.getDoctors());
                    mapOrganizationBloc
                        .add(MapOrganizationEvent.getHospitals());
                  },
                  child: Positioned.fill(
                    bottom: 60,
                    top: -24,
                    child: YandexMap(
                      rotateGesturesEnabled: false,
                      onCameraPositionChanged:
                          (cameraPosition, updateReason, isStopped) {
                        if (isStopped) {
                          mapOrganizationBloc.add(
                              MapOrganizationEvent.changeLatLong(
                                  lat: cameraPosition.target.latitude,
                                  long: cameraPosition.target.longitude,radius: MyFunctions.getRadiusFromZoom(
                                  cameraPosition.zoom)
                                  .floor()));

                        }
                      },
                      onMapTap: (point) {
                        WidgetsBinding.instance.focusManager.primaryFocus
                            ?.unfocus();
                      },
                      mapObjects: _mapObjects,
                      onMapCreated: (controller) async {
                        _mapController = controller;
                        maxZoomLevel = await controller.getMaxZoom();
                        minZoomLevel = await controller.getMinZoom();
                        final position = await MyFunctions.determinePosition();
                        final camera = await _mapController.getCameraPosition();
                        mapOrganizationBloc.add(
                            MapOrganizationEvent.changeLatLong(
                                lat: position.latitude,
                                long: position.longitude,
                                radius:
                                    MyFunctions.getRadiusFromZoom(camera.zoom)
                                        .floor()));

                        mapOrganizationBloc
                            .add(MapOrganizationEvent.getHospitals());
                        mapOrganizationBloc
                            .add(MapOrganizationEvent.getDoctors());
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
                ),
                BlocConsumer<MapOrganizationBloc, MapOrganizationState>(
                  listener: (context, state) {
                    _searchFieldController.text = state.searchText;
                    mapOrganizationBloc.add(MapOrganizationEvent.getDoctors());
                    mapOrganizationBloc
                        .add(MapOrganizationEvent.getHospitals());
                  },
                  listenWhen: (state1, state2) {
                    return state1.searchText != state2.searchText ||
                        state1.radius != state2.radius ||
                        state1.long != state2.long ||
                        state1.lat != state2.lat;
                  },
                  builder: (context, state) {
                    return Positioned(
                      left: 16,
                      right: 16,
                      top: 16 + MediaQuery.of(context).padding.top,
                      child: Container(
                        decoration: BoxDecoration(
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 8),
                              blurRadius: 19,
                              color: chipShadowColor.withOpacity(0.19),
                            ),
                          ],
                          border: Border.all(color: divider),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(4),
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
                              setState(() {
                                if (index == 0) {
                                  MyFunctions.addHospitals(
                                      state.hospitals, context, _mapObjects);
                                } else {
                                  MyFunctions.addDoctors(
                                      state.doctors, context, _mapObjects);
                                }
                              });
                            },
                            unselectedLabelColor: textSecondary,
                            tabs: [
                              Tab(text: LocaleKeys.organization.tr()),
                              Tab(text: LocaleKeys.doctor.tr()),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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
                            SizedBox(),
                            BlocBuilder<SpecializationBloc,
                                SpecializationState>(
                              builder: (context, state) {
                                return MapControllerButtons(
                                  onCurrentLocationTap: () async {
                                    final position =
                                        await MyFunctions.determinePosition();
                                    _mapController.moveCamera(
                                      CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                          target: Point(
                                              latitude: position.latitude,
                                              longitude: position.longitude),
                                          zoom: 15,
                                        ),
                                      ),
                                      animation: const MapAnimation(
                                          duration: 0.15,
                                          type: MapAnimationType.smooth),
                                    );
                                    zoomLevel = 15;
                                  },
                                  onMinusTap: () {
                                    if (minZoomLevel < zoomLevel) {
                                      _mapController.moveCamera(
                                        CameraUpdate.zoomTo(zoomLevel - 1),
                                        animation: const MapAnimation(
                                            duration: 0.2,
                                            type: MapAnimationType.smooth),
                                      );
                                      zoomLevel--;
                                    }
                                  },
                                  onPlusTap: () async {
                                    if (maxZoomLevel > zoomLevel) {
                                      _mapController.moveCamera(
                                        CameraUpdate.zoomTo(zoomLevel + 1),
                                        animation: const MapAnimation(
                                            duration: 0.2,
                                            type: MapAnimationType.smooth),
                                      );
                                      zoomLevel++;
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      // BlocBuilder<SpecializationBloc, SpecializationState>(
                      //   builder: (context, state) {
                      //     return state.specializations.isEmpty
                      //         ? const SizedBox()
                      //         : SizedBox(
                      //             height: 36,
                      //             child: ListView.separated(
                      //               scrollDirection: Axis.horizontal,
                      //               separatorBuilder: (context, index) => const SizedBox(width: 12),
                      //               physics: const BouncingScrollPhysics(),
                      //               padding: const EdgeInsets.symmetric(horizontal: 16),
                      //               itemBuilder: (context, index) => MapButton.chip(
                      //                 selected: state.selectedId == state.specializations[index].id,
                      //                 title: state.specializations[index].title,
                      //                 onTap: (id) {
                      //                   if (state.selectedId == state.specializations[index].id) {
                      //                     specBloc.add(SpecializationEvent.selectSpec(-1));
                      //                   } else {
                      //                     specBloc.add(SpecializationEvent.selectSpec(id));
                      //                   }
                      //                 },
                      //                 id: state.specializations[index].id,
                      //               ),
                      //               itemCount: state.specializations.length,
                      //             ),
                      //           );
                      //   },
                      // // ),
                      // const SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 16, 16,
                            MediaQuery.of(context).viewInsets.bottom + 43),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: textFieldColor),
                          color: white,
                        ),
                        child: GestureDetector(
                          child: BlocBuilder<MapOrganizationBloc,
                              MapOrganizationState>(
                            builder: (context, state) {
                              return Hero(
                                tag: 'search',
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: WButton(
                                        onTap: () {
                                          Navigator.of(context).push(fade(
                                              page: HospitalList(
                                                  controller: _controller)));
                                        },
                                        border: Border.all(color: divider),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 12),
                                        borderRadius: 10,
                                        color: Colors.white,
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.listIcon,
                                              width: 20,
                                              height: 20,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              LocaleKeys.list.tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(fade(
                                              page: HospitalList(
                                                  getFocus: true,
                                                  controller: _controller)));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: lilyWhite),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    AppIcons.search,
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                  const SizedBox(
                                                    width: 6,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      LocaleKeys.search.tr(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline1!
                                                          .copyWith(
                                                              color: state
                                                                      .searchText
                                                                      .isNotEmpty
                                                                  ? textColor
                                                                  : textSecondary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 14),
                                                    ),
                                                  ),
                                                  if (state.searchText
                                                      .isNotEmpty) ...{
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: SvgPicture.asset(
                                                        AppIcons.clearRounded,
                                                        width: 24,
                                                        height: 24,
                                                      ),
                                                    )
                                                  }
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
