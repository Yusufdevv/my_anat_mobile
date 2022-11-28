import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/hospital_specialist/hospital_specialist_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/all_hospital_items_screen.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/all_hospital_specialists.dart';
import 'package:anatomica/features/hospital_single/presentation/widgets/show_all_button.dart';
import 'package:anatomica/features/map/presentation/widgets/doctor_item.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HospitalSpecialists extends StatelessWidget {
  const HospitalSpecialists({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HospitalSpecialistBloc, HospitalSpecialistState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          color: white,
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  LocaleKeys.specialists.tr(),
                  style: Theme.of(context).textTheme.headline4!.copyWith(color: textColor),
                ),
              ),
              const SizedBox(height: 16),
              if (state.status.isSubmissionInProgress) ...{
                const SizedBox(
                  height: 116,
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                )
              } else if (state.status.isSubmissionSuccess) ...{
                if (state.specialists.isNotEmpty) ...{
                  SizedBox(
                    height: 116,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == 5) {
                          return ShowAllButton(
                            onTap: () {
                              Navigator.of(context).push(
                                fade(
                                  page: AllHospitalItemsScreen(
                                    appbarTitle: LocaleKeys.specialists.tr(),
                                    child: AllHospitalSpecialists(
                                      hospitalSpecialistBloc: context.read<HospitalSpecialistBloc>(),
                                    ),
                                  ),
                                ),
                              );
                            },
                            width: MediaQuery.of(context).size.shortestSide - 58,
                            title: 'Все специалисты',
                          );
                        }
                        return SizedBox(
                          width: MediaQuery.of(context).size.shortestSide - 58,
                          child: DoctorItem(
                            showShadow: false,
                            showPosition: true,
                            entity: state.specialists[index],
                          ),
                        );
                      },
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      separatorBuilder: (context, index) => const SizedBox(width: 8),
                      itemCount:
                          state.specialists.length > 5 ? state.specialists.take(6).length : state.specialists.length,
                    ),
                  ),
                } else ...{
                  Center(
                    child: EmptyWidget(
                      hasMargin: false,
                      hasPadding: false,
                      title: LocaleKeys.no_specialists.tr(),
                      content: LocaleKeys.no_specialists_in_this_hospital.tr(),
                    ),
                  )
                }
              },
            ],
          ),
        );
      },
    );
  }
}
