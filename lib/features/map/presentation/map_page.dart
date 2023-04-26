import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/map/domain/usecases/get_doctors.dart';
import 'package:anatomica/features/map/presentation/blocs/doctor_list/doctor_list_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:anatomica/features/map/presentation/screens/hospital_list.dart';
import 'package:anatomica/features/map/presentation/screens/map_screen.dart';
import 'package:anatomica/features/map/presentation/widgets/map_tab_bar.dart';
import 'package:anatomica/features/map/presentation/widgets/the_search_field_of_hospitals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatefulWidget {
  final MediaQueryData mediaQuery;

  const MapPage({required this.mediaQuery, Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin, WidgetsBindingObserver {
  late TextEditingController _searchFieldController;
  late MapOrganizationBloc mapOrganizationBloc;
  late DoctorListBloc doctorListBloc;

  @override
  void initState() {
    doctorListBloc = DoctorListBloc(GetDoctorsUseCase());
    mapOrganizationBloc = MapOrganizationBloc(
      deviceWidth: widget.mediaQuery.size.width,
      tickerProvider: this,
    )..add(MapGetSpecializationsEvent());

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
        BlocProvider(create: (c) => doctorListBloc),
        BlocProvider(create: (c) => mapOrganizationBloc),
      ],
      child: CustomScreen(
        child: BlocBuilder<MapOrganizationBloc, MapOrganizationState>(
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Builder(
                      builder: (context) {
                        if (state.screenStatus.isMap) {
                          return MapScreen(
                            onMapCreateSuccess: (point) {
                              doctorListBloc.add(DoctorListEvent.getDoctors(myPoint: point, search: ''));
                            },
                            mapOrganizationBloc: mapOrganizationBloc,
                            tabController: state.tabController,
                            searchController: _searchFieldController,
                            mediaQuery: widget.mediaQuery,
                          );
                        }
                        if (state.screenStatus.isList) {
                          return HospitalList(
                            myLocation: Point(longitude: state.currentLong, latitude: state.currentLat),
                          );
                        }
                        return Center(
                          child: Container(
                            color: Colors.teal,
                          ),
                        );
                      },
                    ),
                  ),
                  MapTabBar(
                      isDoctor: state.tabController.index == 1,
                      isMap: state.screenStatus.isMap,
                      mediaQuery: widget.mediaQuery,
                      onTabChanged: (index) async {
                        if (state.tabController?.indexIsChanging ?? false) {
                          mapOrganizationBloc.add(
                            MapChangeTabEvent(
                              haveToLoading: true,
                              acuracy: 20,
                              context: context,
                              tab: index,
                            ),
                          );
                        }
                      },
                      tabController: state.tabController),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 150),
                    bottom: MediaQuery.of(context).viewInsets.bottom > 0
                        ? MediaQuery.of(context).viewInsets.bottom - 29
                        : MediaQuery.of(context).padding.bottom - 30,
                    left: 0,
                    right: 0,
                    child: TheSearchFieldOfHospitals(
                      onSearchFieldTap: () {
                        mapOrganizationBloc.add(MapChooseEvent(screenStatus: MapScreenStatus.list, isGetFocus: true));
                      },
                      onLeftButtonPressed: () {
                        mapOrganizationBloc
                            .add(MapChooseEvent(screenStatus: state.screenStatus.switchIt, isGetFocus: false));
                      },
                      isMap: state.screenStatus.isMap,
                      mediaQuery: widget.mediaQuery,
                      focusNode: state.focusNode,
                      controller: state.searchController,
                      isSearching: state.isSearching,
                      onClear: () {
                        state.searchController.clear();
                        context.read<MapOrganizationBloc>().add(MapGetHospitalsWithDistance(
                              search: '',
                              myPoint: state.myPoint,
                            ));
                        doctorListBloc.add(DoctorListEvent.getDoctors(
                          search: '',
                          myPoint: state.myPoint,
                        ));
                        context.read<MapOrganizationBloc>().add(MapChooseEvent(isSuggestion: false));
                        context
                            .read<MapOrganizationBloc>()
                            .add(MapGetSuggestionsEvent(text: state.searchController.text));
                      },
                      onChanged: (value) {
                        context.read<MapOrganizationBloc>().add(MapGetSuggestionsEvent(text: value));
                        if (value.isNotEmpty) {
                          context.read<MapOrganizationBloc>().add(MapChooseEvent(isSuggestion: true));

                          if (state.tabController.index == 0) {
                            context.read<MapOrganizationBloc>().add(MapGetHospitalsWithDistance(
                                  search: value,
                                  myPoint: state.myPoint,
                                ));
                          } else {
                            doctorListBloc.add(DoctorListEvent.getDoctors(
                              search: value,
                              myPoint: state.myPoint,
                            ));
                          }
                        } else {
                          context.read<MapOrganizationBloc>().add(MapGetHospitalsWithDistance(
                                search: '',
                                myPoint: state.myPoint,
                              ));
                          doctorListBloc.add(DoctorListEvent.getDoctors(
                            search: '',
                            myPoint: state.myPoint,
                          ));
                          context.read<MapOrganizationBloc>().add(MapChooseEvent(isSuggestion: false));
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
