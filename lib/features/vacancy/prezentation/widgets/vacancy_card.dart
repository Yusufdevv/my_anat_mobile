import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item_textwidget.dart';
import 'package:flutter/material.dart';

class VacancyCard extends StatelessWidget {
  const VacancyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 223,
      height: 131,
      padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: pattensBlue),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Стоматолог',
            style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text('3 000 000 - 4 500 000 UZS', style: Theme.of(context).textTheme.subtitle1),
          const SizedBox(height: 1),
          const WDivider(margin: EdgeInsets.symmetric(vertical: 10)),
          const SizedBox(height: 10),
          const VacancyItemTextWidget(title: '2 - 5 лет', icon: AppIcons.briefCase),
          const SizedBox(height: 10),
          const VacancyItemTextWidget(title: 'г. Ташкент, ул. Чехова 32', icon: AppIcons.mapPin),
        ],
      ),
    );
  }
}
