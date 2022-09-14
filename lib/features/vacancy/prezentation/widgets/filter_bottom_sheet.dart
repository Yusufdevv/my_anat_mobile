import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_params.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/region_bloc/region_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_bloc/vacancy_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/experience_bottomsheet.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/filter_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/region_bottom_sheet.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/salary_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class FilterBottomSheet extends StatelessWidget {
  final RegionBloc regionBloc;
  final VacancyBloc vacancyBloc;

  const FilterBottomSheet({
    required this.vacancyBloc,
    required this.regionBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrolledBottomSheet(
      title: LocaleKeys.filter.tr(),
      hasHeader: true,
      stackedWButton: WButton(
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        text: LocaleKeys.save.tr(),
        onTap: () async {
          vacancyBloc.add(
            GetVacancyListEvent(
                vacancyParamsEntity: VacancyParamsEntity(
                  salary: vacancyBloc.state.salaryKey,
                  experience: vacancyBloc.state.experienceKey,
                  district: vacancyBloc.state.districtList,
                ),
                onSuccess: () {
                  print('success');
                  print(vacancyBloc.state.districtList);
                  Navigator.of(context).pop();
                }),
          );
        },
      ),
      children: [
        const SizedBox(height: 16),
        FilterItem(
            onTap: () {
              showSalaryBottomSheet(context, vacancyBloc);
            },
            title: LocaleKeys.salary.tr()),
        const SizedBox(height: 12),
        FilterItem(
          onTap: () {
            showExperienceBottomSheet(context, vacancyBloc);
          },
          title: LocaleKeys.experience.tr(),
        ),
        const SizedBox(height: 12),
        FilterItem(
          onTap: () {
            showRegionBottomSheet(context, regionBloc, vacancyBloc);
          },
          title: LocaleKeys.city_district.tr(),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}

void showFilterBottomSheet(BuildContext context, RegionBloc regionBloc, VacancyBloc vacancyBloc) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    builder: (context) => FilterBottomSheet(regionBloc: regionBloc, vacancyBloc: vacancyBloc),
  );
}
