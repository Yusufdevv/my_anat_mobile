import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/image_card.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_title_text.dart';
import 'package:flutter/material.dart';

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
          const ImageCard(imageUrl: 'https://picsum.photos/536/354', height: 58, width: 58),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VacancyTitleText(title: 'EraMed clinic'),
                const SizedBox(height: 4),
                Text(
                  'Врач «Скорой и неотложной медицинской помощи',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style:
                      Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
