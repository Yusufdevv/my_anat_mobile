import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/map/domain/usecases/get_doctors.dart';
import 'package:anatomica/features/map/domain/usecases/get_hospitals.dart';
import 'package:anatomica/features/map/presentation/blocs/doctor_list/doctor_list_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/hospital_list_bloc/hospital_list_bloc.dart';
import 'package:anatomica/features/map/presentation/screens/result_list.dart';
import 'package:anatomica/features/map/presentation/screens/suggestion_list.dart';
import 'package:anatomica/features/map/presentation/widgets/doctors_list.dart';
import 'package:anatomica/features/map/presentation/widgets/map_button.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HospitalList extends StatefulWidget {
  final TabController controller;

  const HospitalList({required this.controller, Key? key}) : super(key: key);

  @override
  State<HospitalList> createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> with TickerProviderStateMixin {
  late TabController _controller;
  late TextEditingController controller;
  late HospitalListBloc bloc;
  late DoctorListBloc doctorListBloc;

  @override
  void initState() {
    doctorListBloc = DoctorListBloc(GetDoctorsUseCase())..add(DoctorListEvent.getDoctors(search: ''));
    bloc = HospitalListBloc(GetHospitalsUseCase())..add(HospitalListEvent.getHospitals(search: ''));
    controller = TextEditingController()
      ..addListener(() {
        if (controller.text.isNotEmpty) {
          bloc.add(HospitalListEvent.changePage(CrossFadeState.showSecond));
        } else {
          bloc.add(HospitalListEvent.changePage(CrossFadeState.showFirst));
        }
      });
    _controller = TabController(length: 2, vsync: this);
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
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          shadowColor: textFieldColor,
          toolbarHeight: 104,
          titleSpacing: 0,
          leadingWidth: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WScaleAnimation(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                  child: SvgPicture.asset(AppIcons.chevronRight),
                ),
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
                  indicator: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(6),
                  ),
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
                    controller: _controller,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: state.crossFadeState == CrossFadeState.showFirst
                            ? const ResultList()
                            :  SuggestionListScreen(onTapItem: (String ) {  }, ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: state.crossFadeState == CrossFadeState.showFirst
                            ? const DoctorsList()
                            :  SuggestionListScreen(onTapItem: (String ) {  },),
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
                      AnimatedCrossFade(
                        crossFadeState: state.crossFadeState,
                        secondChild: const SizedBox(),
                        duration: const Duration(milliseconds: 150),
                        firstChild: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: MapButton.defaultButton(
                                title: LocaleKeys.on_map.tr(),
                                onTap: (id) {},
                                icon: AppIcons.mapIcon, id: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 45),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: textFieldColor),
                          color: white,
                        ),
                        child: SearchField(
                          controller: TextEditingController(),
                          onChanged: (value) {
                            if (_controller.index == 0) {
                              bloc.add(HospitalListEvent.getHospitals(search: value));
                            } else {
                              doctorListBloc.add(DoctorListEvent.getDoctors(search: value));
                            }
                          },
                        ),
                      ),
                      // Expanded(
                      //   child: Container(
                      //     color: white,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
