import 'package:anatomica/features/map/presentation/widgets/interview_item.dart';
import 'package:flutter/material.dart';

class DoctorInterviews extends StatelessWidget {
  const DoctorInterviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
      itemBuilder: (context, index) => const InterviewItem(),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
