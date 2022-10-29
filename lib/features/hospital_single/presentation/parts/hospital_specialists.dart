import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/hospital_specialist/hospital_specialist_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/doctor_item.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalSpecialists extends StatelessWidget {
  final HospitalSpecialistBloc hospitalSpecialistBloc;
  const HospitalSpecialists({required this.hospitalSpecialistBloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: hospitalSpecialistBloc,
      child: BlocBuilder<HospitalSpecialistBloc, HospitalSpecialistState>(
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
                    LocaleKeys.specialists.tr(),
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: textColor),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 116,
                  child: Paginator(
                    paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(state.status),
                    errorWidget: const Text('error'),
                    fetchMoreFunction: () {
                      context.read<HospitalSpecialistBloc>().add(HospitalSpecialistEvent.getMoreSpecialists());
                    },
                    hasMoreToFetch: state.fetchMore,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => SizedBox(
                      width: MediaQuery.of(context).size.shortestSide - 58,
                      child: DoctorItem(
                        showPosition: true,
                        entity: state.specialists[index],
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    emptyWidget: SingleChildScrollView(
                      child: EmptyWidget(
                        title: LocaleKeys.no_specialists.tr(),
                        content: LocaleKeys.no_specialists_in_this_hospital.tr(),
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemCount: state.specialists.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
