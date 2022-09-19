import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/doctor_single/domain/entities/doctor_interview_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InterviewItem extends StatelessWidget {
  final DoctorInterviewEntity interview;

  const InterviewItem({
    required this.interview,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8).copyWith(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: textFieldColor),
        borderRadius: BorderRadius.circular(12),
        color: white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 8),
            blurRadius: 24,
            color: darkerGreen.withOpacity(0.09),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              interview.image.middle,
              height: 184,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Text(
                  interview.title,
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.interviewTime),
                    const SizedBox(width: 4),
                    Text(
                      MyFunctions.getFormattedDuration(interview.videoDuration),
                      style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
