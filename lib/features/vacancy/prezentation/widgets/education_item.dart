import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_education.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/image_card.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_title_text.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class EducationItem extends StatelessWidget {
  final CandidateEducationEntity entity;

  const EducationItem({required this.entity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 20, 14),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: lilyWhite),
        boxShadow: [
          BoxShadow(
            color: darkerGreen.withOpacity(0.09),
            offset: const Offset(0, 8),
            blurRadius: 24,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageCard(imageUrl: entity.place, height: 58, width: 58),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VacancyTitleText(title: entity.place),
                    const SizedBox(height: 4),
                    Text(
                      entity.course,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            entity.degree,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: darkGreen),
          ),
          const SizedBox(height: 8),
          Text(
            '${Jiffy(entity.startDate).year} - ${Jiffy(entity.endDate).year}',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: darkGreen),
          ),
        ],
      ),
    );
  }
}
