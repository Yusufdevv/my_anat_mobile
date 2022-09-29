import 'package:anatomica/features/vacancy/prezentation/blocs/candidate_single/candidate_single_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/experience_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_title_text.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ExperienceItemList extends StatelessWidget {
  final int candidateId;
  const ExperienceItemList({required this.candidateId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CandidateSingleBloc, CandidateSingleState>(
      builder: (context, state) {
        print('experience status: ${state.workStatus}');
        if (state.workStatus.isPure) {
          context.read<CandidateSingleBloc>().add(CandidateWorkEvent(id: candidateId));
        } else if (state.workStatus.isSubmissionInProgress) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state.workStatus.isSubmissionSuccess) {
          if (state.workEntity.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 12),
                  child: VacancyTitleText(title: LocaleKeys.experience.tr(), fontSize: 18),
                ),
                ...List.generate(
                  state.workEntity.length,
                  (index) => ExperienceItem(
                    title: state.workEntity[index].organization.title,
                    subTitle: state.workEntity[index].position,
                    image: state.workEntity[index].organization.logo.middle,
                    isLast: index == state.workEntity.length - 1,
                  ),
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        } else if (state.workStatus.isSubmissionFailure) {
          return const Center(child: Text('Fail'));
        }
        return const SizedBox();
      },
    );
  }
}
