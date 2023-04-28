import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/facilities/facilities_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/all_hospital_items_screen.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_conditions.dart';
import 'package:anatomica/features/hospital_single/presentation/widgets/condition_item.dart';
import 'package:anatomica/features/hospital_single/presentation/widgets/show_all_button.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HospitalConditionsHorizontalList extends StatelessWidget {
  const HospitalConditionsHorizontalList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FacilitiesBloc, FacilitiesState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          color: white,
          margin: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  LocaleKeys.facility.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: textColor),
                ),
              ),
              const SizedBox(height: 16),
              if (state.status.isSubmissionInProgress) ...[
                const Center(child: CupertinoActivityIndicator())
              ] else if (state.status.isSubmissionSuccess) ...[
                if (state.comforts.isNotEmpty) ...{
                  SizedBox(
                    height: 102,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: state.comforts.length > 5
                          ? state.comforts.take(6).length
                          : state.comforts.length,
                      itemBuilder: (context, index) {
                        if (index == 5) {
                          return ShowAllButton(
                            onTap: () {
                              Navigator.of(context).push(
                                fade(
                                  page: AllHospitalItemsScreen(
                                    appbarTitle: LocaleKeys.facility.tr(),
                                    child: HospitalConditions(
                                        facilitiesBloc:
                                            context.read<FacilitiesBloc>()),
                                  ),
                                ),
                              );
                            },
                            width:
                                (MediaQuery.of(context).size.shortestSide / 2) -
                                    45,
                            title: LocaleKeys.all_conditions.tr(),
                          );
                        }
                        return SizedBox(
                          width:
                              (MediaQuery.of(context).size.shortestSide / 2) -
                                  45,
                          child: ConditionItem(
                            entity: state.comforts[index],
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                    ),
                  )
                } else ...{
                  Center(
                    child: EmptyWidget(
                      hasMargin: false,
                      hasPadding: false,
                      title: LocaleKeys.no_conditions.tr(),
                      content: LocaleKeys.no_conditions_in_this_hospital.tr(),
                    ),
                  )
                }
              ],
            ],
          ),
        );
      },
    );
  }
}
