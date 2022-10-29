import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/facilities/facilities_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/widgets/condition_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HospitalConditionsHorizontalList extends StatelessWidget {
  final FacilitiesBloc facilitiesBloc;
  const HospitalConditionsHorizontalList({
    required this.facilitiesBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: facilitiesBloc,
      child: BlocBuilder<FacilitiesBloc, FacilitiesState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    LocaleKeys.facility.tr(),
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: textColor),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 102,
                  child: Builder(builder: (context) {
                    if (state.status.isSubmissionInProgress) {
                      return const Center(child: CupertinoActivityIndicator());
                    } else if (state.status.isSubmissionSuccess) {
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: state.comforts.take(5).length,
                        itemBuilder: (context, index) => SizedBox(
                          width: (MediaQuery.of(context).size.shortestSide / 2) - 45,
                          child: ConditionItem(
                            entity: state.comforts[index],
                          ),
                        ),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(width: 8),
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
