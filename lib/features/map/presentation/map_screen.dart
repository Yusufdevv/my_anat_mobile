import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
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
import 'package:anatomica/features/map/presentation/widgets/map_button.dart';
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

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin, WidgetsBindingObserver {
  late YandexMapController _mapController;
  late TabController _controller;
  late TextEditingController _searchFieldController;
  final List<MapObject<dynamic>> _mapObjects = [];
  late MapOrganizationBloc mapOrganizationBloc;
  late SpecializationBloc specBloc;
  Point currentLocation = const Point(latitude: 0, longitude: 0);

  double latitude = 0;
  double longitude = 0;

  @override
  void initState() {
    specBloc = SpecializationBloc(GetSpecializationUseCase())..add(SpecializationEvent.getSpecs());
    mapOrganizationBloc = MapOrganizationBloc(GetMapHospitalUseCase(), GetMapDoctorUseCase(),
        getTypesUseCase: GetTypesUseCase(repository: serviceLocator<MapRepositoryImpl>()));
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
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 64,
            titleSpacing: 16,
            title: SvgPicture.asset(
              AppIcons.mainLogo,
              height: 20,
            ),
          ),
          body: BlocConsumer<MapOrganizationBloc, MapOrganizationState>(
            listenWhen: (state1, state2) {
              bool isBuild = (state1.hospitals.length != state2.hospitals.length) ||
                  (state1.doctors.length != state2.doctors.length);
              return isBuild;
            },
            listener: (context, state) {
              setState(() {
                if (_controller.index == 0) {
                  MyFunctions.addHospitals(state.hospitals, context, _mapObjects);
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
                    mapOrganizationBloc.add(MapOrganizationEvent.getDoctors(
                        param: MapParameter(
                            spec: state.selectedId,
                            lat: currentLocation.latitude,
                            long: currentLocation.longitude,
                            radius: 1000000)));
                    mapOrganizationBloc.add(MapOrganizationEvent.getHospitals(
                        param: MapParameter(
                            spec: state.selectedId,
                            lat: currentLocation.latitude,
                            long: currentLocation.longitude,
                            radius: 1000000)));
                  },
                  child: Positioned.fill(
                    bottom: 60,
                    child: YandexMap(
                      rotateGesturesEnabled: false,
                      onCameraPositionChanged: (cameraPosition, updateReason, _) {},
                      onMapTap: (point) {
                        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                      },
                      mapObjects: _mapObjects,
                      onMapCreated: (controller) async {
                        _mapController = controller;
                        final position = await MyFunctions.determinePosition();
                        currentLocation = Point(latitude: position.latitude, longitude: position.longitude);
                        mapOrganizationBloc.add(MapOrganizationEvent.getHospitals(
                            param: MapParameter(lat: position.latitude, long: position.longitude, radius: 1000000)));
                        mapOrganizationBloc.add(MapOrganizationEvent.getDoctors(
                            param: MapParameter(lat: position.latitude, long: position.longitude, radius: 1000000)));
                        _mapController.moveCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: Point(latitude: position.latitude, longitude: position.longitude),
                            ),
                          ),
                          animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
                        );
                      },
                    ),
                  ),
                ),
                BlocBuilder<MapOrganizationBloc, MapOrganizationState>(
                  builder: (context, state) {
                    return Positioned(
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
                            setState(() {
                              if (index == 0) {
                                MyFunctions.addHospitals(state.hospitals, context, _mapObjects);
                              } else {
                                MyFunctions.addDoctors(state.doctors, context, _mapObjects);
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
                            MapButton.defaultButton(
                              title: LocaleKeys.list.tr(),
                              onTap: (id) => Navigator.of(context).push(
                                fade(
                                  page: HospitalList(
                                    controller: _controller,
                                  ),
                                ),
                              ),
                              id: 0,
                            ),
                            MapControllerButtons(
                              onCurrentLocationTap: () async {
                                final position = await MyFunctions.determinePosition();
                                _mapController.moveCamera(
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                      target: Point(latitude: position.latitude, longitude: position.longitude),
                                    ),
                                  ),
                                  animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
                                );
                              },
                              onMinusTap: () {
                                _mapController.moveCamera(
                                  CameraUpdate.zoomOut(),
                                  animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
                                );
                              },
                              onPlusTap: () {
                                _mapController.moveCamera(
                                  CameraUpdate.zoomIn(),
                                  animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 36,
                        child: BlocBuilder<SpecializationBloc, SpecializationState>(
                          builder: (context, state) {
                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => const SizedBox(width: 12),
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              itemBuilder: (context, index) => MapButton.chip(
                                selected: state.selectedId == state.specializations[index].id,
                                title: state.specializations[index].title,
                                onTap: (id) {
                                  if (state.selectedId == state.specializations[index].id) {
                                    specBloc.add(SpecializationEvent.selectSpec(-1));
                                  } else {
                                    specBloc.add(SpecializationEvent.selectSpec(id));
                                  }
                                },
                                id: state.specializations[index].id,
                              ),
                              itemCount: state.specializations.length,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, MediaQuery.of(context).viewInsets.bottom + 43),
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
            ),
          ),
        ),
      ),
    );
  }
}
