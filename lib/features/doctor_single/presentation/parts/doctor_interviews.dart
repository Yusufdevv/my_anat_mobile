import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/doctor_single/presentation/blocs/doctor_interviews/doctor_interviews_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/map/presentation/widgets/interview_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorInterviews extends StatelessWidget {
  final int doctorId;
  const DoctorInterviews({required this.doctorId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorInterviewsBloc, DoctorInterviewsState>(
      builder: (context, state) {
        return Paginator(
          errorWidget: const Text('error'),
          emptyWidget: SingleChildScrollView(
            child: EmptyWidget(
              title: LocaleKeys.no_interview.tr(),
              content: LocaleKeys.this_expert_did_not_give_interview.tr(),
            ),
          ),
          itemCount: state.interviews.length,
          padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
          itemBuilder: (context, index) => InterviewItem(
            interview: state.interviews[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(state.getInterviewStatus),
          fetchMoreFunction: () {
            context.read<DoctorInterviewsBloc>().add(GetMoreDoctorInterviews());
          },
          hasMoreToFetch: state.fetchMore,
        );
      },
    );
  }
}
