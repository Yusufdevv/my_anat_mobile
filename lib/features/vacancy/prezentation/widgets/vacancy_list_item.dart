import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item_textwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VacancyListItem extends StatelessWidget {
  const VacancyListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: lilyWhite),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 129,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/536/354',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Иргашев Дильмурад Саатович',
                    style: Theme.of(context).textTheme.headline1!.copyWith(),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset(AppIcons.star)
                ],
              ),
              const SizedBox(height: 4),
              Text('Стоматолог'),
              SizedBox(height: 16),
              VacancyItemTextWidget(title: '', icon: '')
            ],
          )
        ],
      ),
    );
  }
}
