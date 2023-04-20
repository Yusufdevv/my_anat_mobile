import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/vacancies/hospital_vacancies_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/all_hospital_items_screen.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_vacancies.dart';
import 'package:anatomica/features/hospital_single/presentation/widgets/show_all_button.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_vacancy_item.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HospitalVacanciesHorizontalList extends StatelessWidget {
  const HospitalVacanciesHorizontalList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              LocaleKeys.vacancy.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: textColor),
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<HospitalVacanciesBloc, HospitalVacanciesState>(
            builder: (context, state) {
              if (state.status.isSubmissionInProgress) {
                return const SizedBox(
                  height: 160,
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                );
              } else if (state.status.isSubmissionSuccess) {
                if (state.vacancies.isNotEmpty) {
                  return SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        if (index == 5) {
                          return ShowAllButton(
                            onTap: () {
                              Navigator.of(context).push(
                                fade(
                                  page: AllHospitalItemsScreen(
                                    appbarTitle: LocaleKeys.vacancy.tr(),
                                    child: HospitalVacancies(
                                      hospitalVacanciesBloc:
                                          context.read<HospitalVacanciesBloc>(),
                                    ),
                                  ),
                                ),
                              );
                            },
                            width:
                                MediaQuery.of(context).size.shortestSide - 32,
                            // todo locale
                            title: 'Все вакансии',
                          );
                        }
                        return SizedBox(
                          width: MediaQuery.of(context).size.shortestSide - 32,
                          child: HospitalVacancyItem(
                            showShadow: false,
                            entity: state.vacancies[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                      itemCount: state.vacancies.length > 5
                          ? state.vacancies.take(6).length
                          : state.vacancies.length,
                    ),
                  );
                } else {
                  return Center(
                    child: EmptyWidget(
                      hasPadding: false,
                      hasMargin: false,
                      title: LocaleKeys.no_vacancies.tr(),
                      content: LocaleKeys.no_vacancies_in_this_hospital.tr(),
                    ),
                  );
                }
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
