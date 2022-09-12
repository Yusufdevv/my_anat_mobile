import 'package:anatomica/features/vacancy/prezentation/blocs/candidate_single/candidate_single_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/education_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class EducationItemList extends StatelessWidget {
  const EducationItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CandidateSingleBloc, CandidateSingleState>(
      builder: (context, state) {
        if (state.educationStatus.isPure) {
          context.read<CandidateSingleBloc>().add(CandidateEducationEvent(id: 22));
        } else if (state.educationStatus.isSubmissionInProgress) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state.educationStatus.isSubmissionSuccess) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => EducationItem(entity: state.educationList[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: state.educationList.length,
          );
        } else if (state.educationStatus.isSubmissionFailure) {
          return const Center(child: Text('FAil'));
        }
        return const Center(child: CupertinoActivityIndicator());
      },
    );
  }
}
