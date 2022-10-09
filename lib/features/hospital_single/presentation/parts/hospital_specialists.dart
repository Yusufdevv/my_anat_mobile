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
  const HospitalSpecialists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HospitalSpecialistBloc, HospitalSpecialistState>(
      builder: (context, state) {
        return Paginator(
          paginatorStatus:
              MyFunctions.formzStatusToPaginatorStatus(state.status),
          errorWidget: const Text('error'),
          fetchMoreFunction: () {
            context
                .read<HospitalSpecialistBloc>()
                .add(HospitalSpecialistEvent.getMoreSpecialists());
          },
          hasMoreToFetch: state.fetchMore,
          padding: state.specialists.isEmpty
              ? EdgeInsets.zero
              : const EdgeInsets.all(16)
                  .copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
          itemBuilder: (context, index) => DoctorItem(
            showPosition: true,
            entity: state.specialists[index],
          ),
          emptyWidget: SingleChildScrollView(
            child: EmptyWidget(
              title: LocaleKeys.no_specialists.tr(),
              content: LocaleKeys.no_specialists_in_this_hospital.tr(),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: state.specialists.length,
        );
      },
    );
  }
}
