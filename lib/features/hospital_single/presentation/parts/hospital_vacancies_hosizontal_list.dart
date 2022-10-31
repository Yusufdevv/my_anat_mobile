import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/vacancies/hospital_vacancies_bloc.dart';
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
            SizedBox(
              height: 160,
              child: BlocBuilder<HospitalVacanciesBloc, HospitalVacanciesState>(
                builder: (context, state) {
                  if (state.status.isSubmissionInProgress) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  } else if (state.status.isSubmissionSuccess) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) => SizedBox(
                        width: MediaQuery.of(context).size.shortestSide - 32,
                        child: HospitalVacancyItem(
                          showShadow: false,
                          entity: state.vacancies[index],
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(width: 8),
                      itemCount: state.vacancies.length,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}