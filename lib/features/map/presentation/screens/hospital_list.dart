import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/map/domain/usecases/get_doctors.dart';
import 'package:anatomica/features/map/domain/usecases/get_hospitals.dart';
import 'package:anatomica/features/map/domain/usecases/get_suggestions.dart';
import 'package:anatomica/features/map/presentation/blocs/doctor_list/doctor_list_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/hospital_list_bloc/hospital_list_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/suggestion/suggestion_bloc.dart';
import 'package:anatomica/features/map/presentation/screens/result_list.dart';
import 'package:anatomica/features/map/presentation/screens/suggestion_list.dart';
import 'package:anatomica/features/map/presentation/widgets/doctors_list.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HospitalList extends StatefulWidget {
  final TabController controller;
  final bool getFocus;

  const HospitalList({required this.controller, this.getFocus = false, Key? key}) : super(key: key);

  @override
  State<HospitalList> createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> with TickerProviderStateMixin {
  late TabController _controller;
  late TextEditingController controller;
  late HospitalListBloc bloc;
  late DoctorListBloc doctorListBloc;
  late SuggestionBloc suggestionBloc;
  late FocusNode focusNode;
  int currentPage = 0;
  bool isSearching = false;
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

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
    doctorListBloc = DoctorListBloc(GetDoctorsUseCase())..add(DoctorListEvent.getDoctors(search: ''));
    bloc = HospitalListBloc(GetHospitalsUseCase())..add(HospitalListEvent.getHospitals(search: ''));
    suggestionBloc = SuggestionBloc(GetSuggestionsUseCase());
    controller = TextEditingController();
    _controller = TabController(length: 2, vsync: this)
      ..addListener(() {
        suggestionBloc.add(SuggestionEvent.changePage(_controller.index));
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: bloc,
        ),
        BlocProvider.value(
          value: doctorListBloc,
        ),
        BlocProvider.value(
          value: suggestionBloc,
        ),
      ],
      child: WKeyboardDismisser(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 1,
            shadowColor: textFieldColor,
            toolbarHeight: 70,
            titleSpacing: 0,
            leadingWidth: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 36,
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
                  decoration: BoxDecoration(
                    color: textFieldColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TabBar(
                    controller: _controller,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    indicator: BoxDecoration(color: white, borderRadius: BorderRadius.circular(6), boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 8),
                        blurRadius: 24,
                        color: chipShadowColor.withOpacity(0.19),
                      ),
                    ]),
                    labelPadding: EdgeInsets.zero,
                    labelStyle: Theme.of(context).textTheme.headline3,
                    labelColor: textColor,
                    onTap: (index) {},
                    unselectedLabelColor: textSecondary,
                    tabs: [
                      Tab(text: LocaleKeys.organization.tr()),
                      Tab(text: LocaleKeys.doctor.tr()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: BlocBuilder<HospitalListBloc, HospitalListState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _controller,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 150),
                          child: state.crossFadeState == CrossFadeState.showFirst
                              ? const ResultList()
                              : SuggestionListScreen(
                                  isDoctor: false,
                                  searchText: controller.text,
                                  onTapItem: (value) {
                                    focusNode.unfocus();
                                    controller.text = value;
                                    controller.selection =
                                        TextSelection.fromPosition(TextPosition(offset: value.length));
                                    bloc
                                      ..add(HospitalListEvent.getHospitals(search: value))
                                      ..add(HospitalListEvent.changePage(CrossFadeState.showFirst));
                                  },
                                ),
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 150),
                          child: state.crossFadeState == CrossFadeState.showFirst
                              ? const DoctorsList()
                              : SuggestionListScreen(
                                  isDoctor: true,
                                  searchText: controller.text,
                                  onTapItem: (value) {
                                    focusNode.unfocus();
                                    controller.text = value;
                                    controller.selection =
                                        TextSelection.fromPosition(TextPosition(offset: value.length));
                                    doctorListBloc.add(DoctorListEvent.getDoctors(search: value));
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
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 45),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: textFieldColor),
                            color: white,
                          ),
                          child: Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                height: 40,
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: divider)),
                                width: isSearching || controller.text.isNotEmpty
                                    ? 0
                                    : (MediaQuery.of(context).size.width - 44) / 2,
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: AnimatedSwitcher(
                                    duration:
                                        Duration(milliseconds: isSearching || controller.text.isNotEmpty ? 300 : 0),
                                    child: isSearching || controller.text.isNotEmpty
                                        ? const SizedBox(
                                            key: ValueKey<int>(2),
                                          )
                                        : Row(
                                            children: [
                                              SvgPicture.asset(
                                                AppIcons.map,
                                                width: 20,
                                                height: 20,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                LocaleKeys.on_map.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                                              )
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: isSearching || controller.text.isNotEmpty ? 0 : 12,
                              ),
                              Expanded(
                                child: SearchField(
                                  stateKey: _formKey,
                                  focusNode: focusNode,
                                  controller: controller,
                                  onClear: () {
                                    bloc.add(HospitalListEvent.getHospitals(search: ''));
                                    doctorListBloc.add(DoctorListEvent.getDoctors(search: ''));
                                    bloc.add(HospitalListEvent.changePage(CrossFadeState.showFirst));
                                    suggestionBloc.add(SuggestionEvent.getSuggestions(''));
                                  },
                                  onChanged: (value) {
                                    suggestionBloc.add(SuggestionEvent.getSuggestions(value));
                                    if (value.isNotEmpty) {
                                      bloc.add(HospitalListEvent.changePage(CrossFadeState.showSecond));
                                    } else {
                                      bloc.add(HospitalListEvent.changePage(CrossFadeState.showFirst));
                                    }
                                  },
                                ),
                              ),
                              isSearching
                                  ? GestureDetector(
                                      onTap: () {
                                        focusNode.unfocus();
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 12, right: 4),
                                        child: Text(
                                          LocaleKeys.close.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(fontWeight: FontWeight.w600, fontSize: 12),
                                        ),
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ],
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
