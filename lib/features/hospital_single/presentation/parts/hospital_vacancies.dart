import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/vacancies/hospital_vacancies_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_vacancy_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalVacancies extends StatelessWidget {
  final HospitalVacanciesBloc hospitalVacanciesBloc;
  const HospitalVacancies({required this.hospitalVacanciesBloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: hospitalVacanciesBloc,
      child: BlocBuilder<HospitalVacanciesBloc, HospitalVacanciesState>(
        builder: (context, state) {
          return Paginator(
            errorWidget: const Text('error'),
            paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(state.status),
            fetchMoreFunction: () {
              context.read<HospitalVacanciesBloc>().add(HospitalVacanciesEvent.getMoreVacancies());
            },
            hasMoreToFetch: state.fetchMore,
            emptyWidget: SingleChildScrollView(
              child: EmptyWidget(
                title: LocaleKeys.no_vacancies.tr(),
                content: LocaleKeys.no_vacancies_in_this_hospital.tr(),
              ),
            ),
            padding: state.vacancies.isEmpty
                ? EdgeInsets.zero
                : const EdgeInsets.all(16).copyWith(bottom: 16 + MediaQuery.of(context).padding.bottom),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: state.vacancies.length,
            itemBuilder: (context, index) => HospitalVacancyItem(
              entity: state.vacancies[index],
            ),
          );
        },
      ),
    );
  }
}
