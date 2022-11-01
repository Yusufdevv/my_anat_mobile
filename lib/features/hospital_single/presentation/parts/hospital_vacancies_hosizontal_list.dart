import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/vacancies/hospital_vacancies_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/widgets/show_all_button.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_vacancy_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HospitalVacanciesHorizontalList extends StatelessWidget {
  const HospitalVacanciesHorizontalList({
    Key? key,
    required this.vacanciesBloc,
  }) : super(key: key);

  final HospitalVacanciesBloc vacanciesBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: vacanciesBloc,
      child: Container(
        color: white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                LocaleKeys.vacancy.tr(),
                style: Theme.of(context).textTheme.headline4!.copyWith(color: textColor),
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
                              onTap: () {},
                              width: MediaQuery.of(context).size.shortestSide - 32,
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
                        separatorBuilder: (context, index) => const SizedBox(width: 8),
                        itemCount: state.vacancies.length > 5 ? state.vacancies.take(6).length : state.vacancies.length,
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
      ),
    );
  }
}
