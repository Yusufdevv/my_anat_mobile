import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/presentation/bloc/login_sign_up_bloc/login_sign_up_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_doctors.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_hospitals.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_hospitals_with_distance.dart';
import 'package:anatomica/features/map/domain/usecases/get_service_usecase.dart';
import 'package:anatomica/features/map/domain/usecases/get_specialization.dart';
import 'package:anatomica/features/map/domain/usecases/get_types_usecase.dart';
import 'package:anatomica/features/map/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/org_map_v2_bloc/org_map_v2_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/specialization/specialization_bloc.dart';
import 'package:anatomica/features/map/presentation/screens/hospital_list.dart';
import 'package:anatomica/features/map/presentation/widgets/map_controller_buttons.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
  late OrgMapV2Bloc orgMapV2Bloc;
  late SpecializationBloc specBloc;

  double latitude = 0;
  double longitude = 0;
  double zoomLevel = 15;
  int currentRadius = 100000;
  double maxZoomLevel = 0;
  double minZoomLevel = 0;
  double accuracy = 0;
  late Point myPoint;

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
    orgMapV2Bloc = OrgMapV2Bloc(
        useCase: GetMapHospitalsWithDistanceUseCase(
            mapRepository: serviceLocator<MapRepositoryImpl>()),
        typesUseCase:
            GetTypesUseCase(repository: serviceLocator<MapRepositoryImpl>()),
        serviceUsecase: GetServicesV2UseCase(
            repository: serviceLocator<MapRepositoryImpl>()));
    _controller = TabController(length: 2, vsync: this)
      ..addListener(() {
        if (_controller.indexIsChanging) {
          print('change tab');
          orgMapV2Bloc.add(OrgMapV2Event.changeTab(index: _controller.index));
        }
        print('listener ishladi');
      });
    _searchFieldController = TextEditingController();
    myPoint = const Point(latitude: 0, longitude: 0);
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
        BlocProvider.value(value: mapOrganizationBloc),
        BlocProvider.value(value: specBloc),
        BlocProvider.value(value: orgMapV2Bloc),
      ],
      child: CustomScreen(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                    onClusterTap: (cluster) {},
                    points: state.hospitals,
                    context: context,
                    mapObjects: _mapObjects,
                    controller: _mapController,
                    point: myPoint,
                    accuracy: accuracy,
                  );
                } else {
                  MyFunctions.addDoctors(state.doctors, context, _mapObjects,
                      _mapController, myPoint, accuracy);
                }
              });
            },
            builder: (context, mapOrganizationState) => Stack(
              children: [
                Positioned.fill(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 48,
                  top: -24,
                  child: YandexMap(
                    rotateGesturesEnabled: false,
                    onCameraPositionChanged:
                        (cameraPosition, updateReason, isStopped) async {
                      if (isStopped) {
                        zoomLevel = cameraPosition.zoom;
                        mapOrganizationBloc.add(
                            MapOrganizationEvent.changeLatLong(
                                lat: cameraPosition.target.latitude,
                                long: cameraPosition.target.longitude,
                                radius: MyFunctions.getRadiusFromZoom(
                                        cameraPosition.zoom)
                                    .floor()));
                        await StorageRepository.putDouble(
                            'lat', cameraPosition.target.latitude);
                        await StorageRepository.putDouble(
                            'long', cameraPosition.target.longitude);
                      }
                    },
                    onMapTap: (point) {
                      WidgetsBinding.instance.focusManager.primaryFocus
                          ?.unfocus();
                    },
                    mapObjects: _mapObjects,
                    onMapCreated: (controller) async {
                      if (_controller.index != orgMapV2Bloc.state.tabIndex) {
                        print(
                            '${_controller.index} indexesss ${orgMapV2Bloc.state.tabIndex}');
                        _controller.animateTo(orgMapV2Bloc.state.tabIndex);
                      }
                      _mapController = controller;
                      maxZoomLevel = await controller.getMaxZoom();
                      minZoomLevel = await controller.getMinZoom();
                      final camera = await _mapController.getCameraPosition();
                      final position = Point(
                        latitude: StorageRepository.getDouble(
                          'lat',
                          defValue: 41.310990,
                        ),
                        longitude: StorageRepository.getDouble(
                          'long',
                          defValue: 69.281997,
                        ),
                      );
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
                      context.read<MapOrganizationBloc>().add(
                            MapOrganizationEvent.getCurrentLocation(
                              onError: (message) {
                                context
                                    .read<ShowPopUpBloc>()
                                    .add(ShowPopUp(message: message));
                              },
                              onSuccess: (position) async {
                                myPoint = Point(
                                    latitude: position.latitude,
                                    longitude: position.longitude);
                                final myPlaceMark =
                                    await MyFunctions.getMyPoint(
                                        myPoint, context);
                                setState(() {
                                  _mapObjects.add(myPlaceMark);
                                });
                                accuracy = position.accuracy;
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

                                mapOrganizationBloc.add(
                                  MapOrganizationEvent.changeLatLong(
                                    lat: position.latitude,
                                    long: position.longitude,
                                    radius: MyFunctions.getRadiusFromZoom(
                                            camera.zoom)
                                        .floor(),
                                  ),
                                );
                                mapOrganizationBloc.add(
                                    MapOrganizationEvent.getHospitals(
                                        latitude: position.latitude,
                                        longitude: position.longitude,
                                        radius: MyFunctions.getRadiusFromZoom(
                                            camera.zoom)));
                                mapOrganizationBloc.add(
                                  MapOrganizationEvent.getDoctors(
                                    latitude: position.latitude,
                                    longitude: position.longitude,
                                    radius: MyFunctions.getRadiusFromZoom(
                                        camera.zoom),
                                  ),
                                );
                              },
                            ),
                          );
                    },
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  top: 0,
                  child: Container(
                    height: MediaQuery.of(context).padding.top + 84,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            white.withOpacity(0.65),
                            white.withOpacity(0)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
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
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 8),
                                    blurRadius: 24,
                                    color: chipShadowColor.withOpacity(0.19),
                                  ),
                                ]),
                            labelPadding: EdgeInsets.zero,
                            labelStyle:
                                Theme.of(context).textTheme.displaySmall,
                            labelColor: textColor,
                            onTap: (index) {
                              if (index == 0) {
                                setState(() {
                                  MyFunctions.addHospitals(
                                    onClusterTap: (cluster) {},
                                    points: state.hospitals,
                                    context: context,
                                    mapObjects: _mapObjects,
                                    controller: _mapController,
                                    point: myPoint,
                                    accuracy: accuracy,
                                  );
                                });
                              } else {
                                setState(() {
                                  MyFunctions.addDoctors(
                                      state.doctors,
                                      context,
                                      _mapObjects,
                                      _mapController,
                                      myPoint,
                                      accuracy);
                                });
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
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: MediaQuery.of(context).padding.bottom - 28,
                  child: BlocBuilder<LoginSignUpBloc, LoginSignUpState>(
                    builder: (context, loginState) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        child: !loginState.showMainTab
                            ? const SizedBox()
                            : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const SizedBox(),
                                        MapControllerButtons(
                                          onCurrentLocationTap: () async {
                                            context
                                                .read<MapOrganizationBloc>()
                                                .add(
                                                  MapOrganizationEvent
                                                      .getCurrentLocation(
                                                    onSuccess:
                                                        (position) async {
                                                      myPoint = Point(
                                                          latitude:
                                                              position.latitude,
                                                          longitude: position
                                                              .longitude);
                                                      final myPlaceMark =
                                                          await MyFunctions
                                                              .getMyPoint(
                                                                  myPoint,
                                                                  context);
                                                      setState(() {
                                                        _mapObjects
                                                            .add(myPlaceMark);
                                                      });
                                                      accuracy =
                                                          position.accuracy;
                                                      _mapController.moveCamera(
                                                        CameraUpdate
                                                            .newCameraPosition(
                                                          CameraPosition(
                                                            target: Point(
                                                                latitude: position
                                                                    .latitude,
                                                                longitude: position
                                                                    .longitude),
                                                            zoom: 15,
                                                          ),
                                                        ),
                                                        animation:
                                                            const MapAnimation(
                                                                duration: 0.15,
                                                                type:
                                                                    MapAnimationType
                                                                        .smooth),
                                                      );
                                                      zoomLevel = 15;
                                                    },
                                                    onError: (message) {
                                                      context
                                                          .read<ShowPopUpBloc>()
                                                          .add(ShowPopUp(
                                                              message:
                                                                  message));
                                                    },
                                                  ),
                                                );
                                            zoomLevel = 15;
                                          },
                                          onMinusTap: () {
                                            if (minZoomLevel < zoomLevel) {
                                              _mapController.moveCamera(
                                                CameraUpdate.zoomTo(
                                                    zoomLevel - 1),
                                                animation: const MapAnimation(
                                                    duration: 0.2,
                                                    type: MapAnimationType
                                                        .smooth),
                                              );
                                              zoomLevel--;
                                            }
                                          },
                                          onPlusTap: () async {
                                            if (maxZoomLevel > zoomLevel) {
                                              _mapController.moveCamera(
                                                CameraUpdate.zoomTo(
                                                    zoomLevel + 1),
                                                animation: const MapAnimation(
                                                    duration: 0.2,
                                                    type: MapAnimationType
                                                        .smooth),
                                              );
                                              zoomLevel++;
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        16,
                                        16,
                                        16,
                                        MediaQuery.of(context)
                                                .viewInsets
                                                .bottom +
                                            43),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: textFieldColor),
                                      color: white,
                                    ),
                                    child: GestureDetector(
                                      child: BlocBuilder<MapOrganizationBloc,
                                          MapOrganizationState>(
                                        builder: (context, state) {
                                          return Row(
                                            children: [
                                              Expanded(
                                                child: WButton(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .push(fade(
                                                            page: HospitalList(
                                                      controller: _controller,
                                                      myLocation: myPoint,
                                                      orgMapV2Bloc:
                                                          orgMapV2Bloc,
                                                    )));
                                                  },
                                                  border: Border.all(
                                                      color: divider),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10,
                                                      horizontal: 12),
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
                                                            .displayLarge!
                                                            .copyWith(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .push(fade(
                                                              page:
                                                                  HospitalList(
                                                        getFocus: true,
                                                        controller: _controller,
                                                        myLocation: myPoint,
                                                        orgMapV2Bloc:
                                                            orgMapV2Bloc,
                                                      )));
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: lilyWhite),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                AppIcons.search,
                                                                width: 20,
                                                                height: 20,
                                                              ),
                                                              const SizedBox(
                                                                width: 6,
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  LocaleKeys
                                                                      .search
                                                                      .tr(),
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .displayLarge!
                                                                      .copyWith(
                                                                          color: state.searchText.isNotEmpty
                                                                              ? textColor
                                                                              : textSecondary,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          fontSize:
                                                                              14),
                                                                ),
                                                              ),
                                                              if (state
                                                                  .searchText
                                                                  .isNotEmpty) ...{
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    AppIcons
                                                                        .clearRounded,
                                                                    width: 24,
                                                                    height: 24,
                                                                  ),
                                                                )
                                                              }
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                      );
                    },
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  top: 0,
                  child: Container(
                    height: MediaQuery.of(context).padding.top + 84,
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
