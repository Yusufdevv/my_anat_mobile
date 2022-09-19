import 'package:anatomica/features/hospital_single/presentation/bloc/facilities/facilities_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/widgets/condition_item.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HospitalConditions extends StatelessWidget {
  const HospitalConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FacilitiesBloc, FacilitiesState>(
      builder: (context, state) {
        if (state.status.isSubmissionInProgress) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state.status.isSubmissionSuccess) {
          if (state.comforts.isEmpty) {
            return const SingleChildScrollView(
              child: EmptyWidget(
                title: 'Qulayliklar mavjud emas!',
                content: 'Bu klinikada qulayliklar mavjud emas!',
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
    );
  }
}
