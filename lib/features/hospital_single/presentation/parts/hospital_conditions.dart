import 'package:anatomica/features/hospital_single/presentation/bloc/facilities/facilities_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/widgets/condition_item.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HospitalConditions extends StatelessWidget {
  final FacilitiesBloc facilitiesBloc;
  const HospitalConditions({required this.facilitiesBloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: facilitiesBloc,
      child: BlocBuilder<FacilitiesBloc, FacilitiesState>(
        builder: (context, state) {
          if (state.status.isSubmissionInProgress) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state.status.isSubmissionSuccess) {
            if (state.comforts.isEmpty) {
              return SingleChildScrollView(
                child: EmptyWidget(
                  title: LocaleKeys.no_conditions.tr(),
                  content: LocaleKeys.no_conditions_in_this_hospital.tr(),
                ),
              );
            } else {
              return GridView.builder(
                padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 102,
                ),
                itemCount: (state.comforts.length + 1) % 2 == 0 ? state.comforts.length + 1 : state.comforts.length,
                itemBuilder: (context, index) {
                  if (index == state.comforts.length) {
                    if (state.fetchMore) {
                      context.read<FacilitiesBloc>().add(FacilitiesEvent.getMoreFacilities());
                    }
                    return const SizedBox.shrink();
                  } else {
                    return ConditionItem(
                      entity: state.comforts[index],
                    );
                  }
                },
              );
            }
          } else if (state.status.isSubmissionFailure) {
            return const Center(
              child: Text('error'),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
