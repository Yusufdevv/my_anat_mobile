import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/image_card.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item_textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VacancyCard extends StatelessWidget {
  const VacancyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: lilyWhite),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Стоматолог',
                    style: Theme.of(context).textTheme.headline1!.copyWith(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'SMALTO Dental Clinic',
                    style: Theme.of(context).textTheme.headline1,
                  )
                ],
              ),
              const Spacer(),
              const ImageCard(imageUrl: 'https://picsum.photos/536/354')
            ],
          ),
          const SizedBox(height: 20),
          const VacancyItemTextWidget(title: '', icon: ''),
          const VacancyItemTextWidget(title: '', icon: ''),
          const VacancyItemTextWidget(title: '', icon: ''),
          const SizedBox(height: 12),
          Row(
            children: [
              Text('Опубликовано:', style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(width: 4),
              Text('20 июнь, 2022', style: Theme.of(context).textTheme.bodyText1),
              const Spacer(),
              SvgPicture.asset(AppIcons.star),
            ],
          )
        ],
      ),
    );
  }
}
