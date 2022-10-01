import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_params.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_list.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/region_bloc/region_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_bloc/vacancy_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/experience_bottomsheet.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/filter_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/region_bottom_sheet.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/salary_bottom_sheet.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterBottomSheet extends StatelessWidget {
  final RegionBloc regionBloc;
  final VacancyBloc vacancyBloc;
  final bool hasSalary;

  const FilterBottomSheet({
    required this.vacancyBloc,
    required this.regionBloc,
    this.hasSalary = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider.value(
      value: vacancyBloc,
      child: BlocBuilder<VacancyBloc, VacancyState>(
        builder: (context, state) {
          return ScrolledBottomSheet(
            title: LocaleKeys.filter.tr(),
            hasHeader: true,
            showClear: true,
            onClear: () {
              vacancyBloc.add(SelectSalaryFilterEvent(salaryKey: null, onSuccess: () {}));
              vacancyBloc.add(SelectExperienceEvent(onSuccess: () {}, experienceKey: null));
              vacancyBloc.add(SelectDistrictEvent(onSuccess: () {}, districtList: null));
            },
            stackedWButton: WButton(
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              text: LocaleKeys.save.tr(),
              onTap: () async {
                if (hasSalary) {
                  vacancyBloc.add(
                    GetVacancyListEvent(
                      vacancyParamsEntity: VacancyParamsEntity(
                        salary: state.salaryKey,
                        experience: state.experienceKey,
                        district: state.districtList,
                      ),
                      onSuccess: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                } else {
                  print(state.experienceKey);
                  print(state.districtList);
                  vacancyBloc.add(
                    GetCandidateListEvent(
                        params: CandidateListParams(
                          experience: state.experienceKey,
                          district: state.districtList,
                        ),
                        onSuccess: () {
                          Navigator.of(context).pop();
                        }),
                  );
                }
              },
            ),
            children: [
              const SizedBox(height: 16),
              hasSalary
                  ? FilterItem(
                      onTap: () {
                        showSalaryBottomSheet(
                          context: context,
                          vacancyBloc: vacancyBloc,
                          list: state.salaryKey ?? [],
                        );
                      },
                      title: LocaleKeys.salary.tr())
                  : const SizedBox(),
              const SizedBox(height: 12),
              FilterItem(
                onTap: () {
                  showExperienceBottomSheet(context, vacancyBloc, state.experienceKey ?? []);
                },
                title: LocaleKeys.experience.tr(),
              ),
              const SizedBox(height: 12),
              FilterItem(
                onTap: () {
                  showRegionBottomSheet(
                    context,
                    regionBloc,
                    vacancyBloc,
                    state.districtList,
                  );
                },
                title: LocaleKeys.city_district.tr(),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}

void showFilterBottomSheet(BuildContext context, RegionBloc regionBloc, VacancyBloc vacancyBloc, bool hasSalary) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    builder: (context) => FilterBottomSheet(
      regionBloc: regionBloc,
      vacancyBloc: vacancyBloc,
      hasSalary: hasSalary,
    ),
  );
}
