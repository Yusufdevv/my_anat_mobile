import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/image_card.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_title_text.dart';
import 'package:flutter/material.dart';

class ExperienceItem extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final bool isLast;

  const ExperienceItem({
    this.title = '',
    this.image = '',
    this.subTitle = '',
    this.isLast = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16)
          .copyWith(bottom: isLast ? 0 : 12),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      height: 82,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: lilyWhite),
          color: white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 24,
              color: darkerGreen.withOpacity(0.09),
            )
          ]),
      child: Row(
        children: [
          ImageCard(imageUrl: image, height: 58, width: 58),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VacancyTitleText(title: title),
                const SizedBox(height: 4),
                Text(
                  subTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
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
    );
  }
}
