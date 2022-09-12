import 'package:anatomica/features/vacancy/prezentation/blocs/candidate_single/candidate_single_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/experience_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ExperienceItemList extends StatelessWidget {
  const ExperienceItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CandidateSingleBloc, CandidateSingleState>(
      builder: (context, state) {
        print('experience status: ${state.workStatus}');
        if (state.workStatus.isPure) {
          context.read<CandidateSingleBloc>().add(CandidateWorkEvent(id: 14));
        } else if (state.workStatus.isSubmissionInProgress) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state.workStatus.isSubmissionSuccess) {
          print(state.workEntity);
          return ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              print('length:${state.workEntity.length}');
              return ExperienceItem(
                title: state.workEntity[index].organization.title,
                subTitle: state.workEntity[index].position,
                image: state.workEntity[index].organization.logo.middle,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 12);
            },
            itemCount: state.workEntity.length,
          );
        } else if (state.workStatus.isSubmissionFailure) {
          return const Center(child: Text('Fail'));
        }
        return const SizedBox();
      },
    );
  }
}
