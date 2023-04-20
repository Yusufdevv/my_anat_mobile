import 'dart:developer';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/map/domain/usecases/get_doctors.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_hospitals_with_distance.dart';
import 'package:anatomica/features/map/domain/usecases/get_suggestions.dart';
import 'package:anatomica/features/map/presentation/blocs/doctor_list/doctor_list_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/hospital_list_bloc/hospital_list_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/org_map_v2_bloc/org_map_v2_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/suggestion/suggestion_bloc.dart';
import 'package:anatomica/features/map/presentation/screens/result_list.dart';
import 'package:anatomica/features/map/presentation/screens/suggestion_list.dart';
import 'package:anatomica/features/map/presentation/widgets/doctors_list.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_app_bar.dart';
import 'package:anatomica/features/map/presentation/widgets/the_search_field_of_hospitals.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HospitalList extends StatefulWidget {
  final TabController controller;
  final bool getFocus;
  final Point myLocation;
  final OrgMapV2Bloc orgMapV2Bloc;

  const HospitalList(
      {required this.controller, required this.myLocation, required this.orgMapV2Bloc, this.getFocus = false, Key? key})
      : super(key: key);

  @override
  State<HospitalList> createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> with TickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController controller;
  late HospitalListBloc bloc;
  late DoctorListBloc doctorListBloc;
  late SuggestionBloc suggestionBloc;
  late FocusNode focusNode;
  int currentPage = 0;
  bool isSearching = false;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    focusNode = FocusNode()
      ..addListener(() {
        if (focusNode.hasFocus) {
          setState(() {
            isSearching = true;
          });
        } else {
          setState(() {
            isSearching = false;
          });
        }
      });

    if (widget.getFocus) {
      focusNode.requestFocus();
    }
    doctorListBloc = DoctorListBloc(GetDoctorsUseCase())
      ..add(DoctorListEvent.getDoctors(search: '', myPoint: widget.myLocation));
    bloc = HospitalListBloc(GetMapHospitalsWithDistanceUseCase(mapRepository: serviceLocator<MapRepositoryImpl>()))
      ..add(HospitalListEvent.getHospitals(
        search: '',
        myPoint: widget.myLocation,
      ));
    suggestionBloc = SuggestionBloc(GetSuggestionsUseCase());

    controller = TextEditingController();
    suggestionBloc.add(SuggestionEvent.changePage(widget.controller.index));
    _tabController = TabController(length: 2, vsync: this, initialIndex: widget.controller.index)
      ..addListener(() {
        suggestionBloc.add(SuggestionEvent.changePage(_tabController.index));
        if (_tabController.indexIsChanging) {
          widget.orgMapV2Bloc.add(OrgMapV2Event.changeTab(index: _tabController.index));
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_tabController.index != widget.orgMapV2Bloc.state.tabIndex) {
      print('${_tabController.index} indexesss hospital ${widget.orgMapV2Bloc.state.tabIndex}');
      _tabController.animateTo(widget.orgMapV2Bloc.state.tabIndex);
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: bloc),
        BlocProvider.value(value: doctorListBloc),
        BlocProvider.value(value: suggestionBloc),
      ],
      child: WKeyboardDismisser(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: HospitalAppBar(
            controller: _tabController,
            mediaQuery: MediaQuery.of(context),
          ),
          body: BlocBuilder<HospitalListBloc, HospitalListState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 150),
                          child: state.crossFadeState == CrossFadeState.showFirst
                              ? ResultList(myPoint: widget.myLocation)
                              : SuggestionListScreen(
                                  isDoctor: false,
                                  myPoint: widget.myLocation,
                                  searchText: controller.text,
                                  onTapItem: (value) {
                                    focusNode.unfocus();
                                    controller.text = value;
                                    controller.selection =
                                        TextSelection.fromPosition(TextPosition(offset: value.length));
                                    bloc
                                      ..add(HospitalListEvent.getHospitals(
                                        search: value,
                                        myPoint: widget.myLocation,
                                      ))
                                      ..add(HospitalListEvent.changePage(CrossFadeState.showFirst));
                                  },
                                ),
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 150),
                          child: state.crossFadeState == CrossFadeState.showFirst
                              ? DoctorsList(
                                  textEditingController: controller,
                                  myPoint: widget.myLocation,
                                )
                              : SuggestionListScreen(
                                  isDoctor: true,
                                  myPoint: widget.myLocation,
                                  searchText: controller.text,
                                  onTapItem: (value) {
                                    focusNode.unfocus();
                                    controller.text = value;
                                    controller.selection =
                                        TextSelection.fromPosition(TextPosition(offset: value.length));
                                    doctorListBloc.add(DoctorListEvent.getDoctors(
                                      search: controller.text,
                                      myPoint: widget.myLocation,
                                    ));
                                    bloc.add(HospitalListEvent.changePage(CrossFadeState.showFirst));
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 150),
                    bottom: MediaQuery.of(context).viewInsets.bottom > 0
                        ? MediaQuery.of(context).viewInsets.bottom - 29
                        : MediaQuery.of(context).padding.bottom - 30,
                    left: 0,
                    right: 0,
                    child: TheSearchFieldOfHospitals(
                      focusNode: focusNode,
                      controller: controller,
                      formKey: _formKey,
                      isSearching: isSearching,
                      onClear: () {
                        controller.clear();
                        bloc.add(HospitalListEvent.getHospitals(
                          search: '',
                          myPoint: widget.myLocation,
                        ));
                        doctorListBloc.add(DoctorListEvent.getDoctors(
                          search: '',
                          myPoint: widget.myLocation,
                        ));
                        bloc.add(HospitalListEvent.changePage(CrossFadeState.showFirst));
                        suggestionBloc.add(SuggestionEvent.getSuggestions(controller.text));
                      },
                      onChanged: (value) {
                        log(':::::::::: the changing value  ${value} / ${_tabController.index}  ::::::::::');
                        suggestionBloc.add(SuggestionEvent.getSuggestions(value));
                        if (value.isNotEmpty) {
                          bloc.add(HospitalListEvent.changePage(CrossFadeState.showSecond));
                          if (_tabController.index == 0) {
                            bloc.add(HospitalListEvent.getHospitals(
                              search: value,
                              myPoint: widget.myLocation,
                            ));
                          } else {
                            doctorListBloc.add(DoctorListEvent.getDoctors(
                              search: value,
                              myPoint: widget.myLocation,
                            ));
                          }
                        } else {
                          bloc.add(HospitalListEvent.getHospitals(
                            search: '',
                            myPoint: widget.myLocation,
                          ));
                          doctorListBloc.add(DoctorListEvent.getDoctors(
                            search: '',
                            myPoint: widget.myLocation,
                          ));
                          bloc.add(HospitalListEvent.changePage(CrossFadeState.showFirst));
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
