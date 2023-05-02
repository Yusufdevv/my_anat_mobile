import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_params.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_list.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/region_bloc/region_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_bloc/vacancy_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/experience_bottomsheet.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/filter_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/profession_bottom_sheet.dart';
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
    return BlocProvider.value(
      value: vacancyBloc,
      child: BlocBuilder<VacancyBloc, VacancyState>(
        builder: (context, state) {
          return ScrolledBottomSheet(
            title: LocaleKeys.filter.tr(),
            hasHeader: true,
            header: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  )),
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.filter.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: WScaleAnimation(
                        onTap: () {
                          vacancyBloc.add(SelectSalaryFilterEvent(
                              salaryKey: const [], onSuccess: () {}));
                          vacancyBloc.add(SelectExperienceEvent(
                              onSuccess: () {}, experienceKey: const []));
                          vacancyBloc.add(SelectDistrictEvent(
                              onSuccess: () {}, districtList: const []));
                          vacancyBloc.add(SelectCategoryEvent(id: const []));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            LocaleKeys.clean.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            showClear: true,
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
                          category: state.selectCategoryId),
                      onSuccess: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                } else {
                  vacancyBloc.add(
                    GetCandidateListEvent(
                        params: CandidateListParams(
                          experience: state.experienceKey,
                          district: state.districtList,
                          categoryId: state.selectCategoryId,
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
              FilterItem(
                onTap: () {
                  showProfessionBottomSheet(
                      context, vacancyBloc, state.selectCategoryId);
                },
                title: LocaleKeys.professions.tr(),
              ),
              const SizedBox(height: 12),
              if (hasSalary) ...[
                FilterItem(
                    onTap: () {
                      showSalaryBottomSheet(
                        context: context,
                        vacancyBloc: vacancyBloc,
                        list: state.salaryKey ?? [],
                      );
                    },
                    title: LocaleKeys.salary.tr()),
                const SizedBox(height: 12),
              ],
              FilterItem(
                onTap: () {
                  showExperienceBottomSheet(
                      context, vacancyBloc, state.experienceKey ?? []);
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

void showFilterBottomSheet(BuildContext context, RegionBloc regionBloc,
    VacancyBloc vacancyBloc, bool hasSalary) {
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
