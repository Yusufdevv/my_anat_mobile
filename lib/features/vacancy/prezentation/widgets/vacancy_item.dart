import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/image_card.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item_textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VacancyItem extends StatelessWidget {
  final EdgeInsets? margin;
  final VoidCallback onTap;

  const VacancyItem({this.margin, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        margin: margin ?? const EdgeInsets.fromLTRB(16, 0, 16, 0),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: lilyWhite),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                const ImageCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bW9kZWxzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')
              ],
            ),
            const SizedBox(height: 20),
            const VacancyItemTextWidget(title: '2 - 5 лет', icon: AppIcons.briefCase),
            const SizedBox(height: 4),
            const VacancyItemTextWidget(
                title: 'ул.Чехова 32 Ташкент Ташкент UZ Tashkent UZ, '
                    '100015',
                icon: AppIcons.mapPin),
            const SizedBox(height: 4),
            const VacancyItemTextWidget(
                title: '3.000 .000 - 4.500.000', icon: AppIcons.cashBanknote),
            const SizedBox(height: 12),
            Row(
              children: [
                Text('Опубликовано:', style: Theme.of(context).textTheme.subtitle2),
                const SizedBox(width: 4),
                Text('20 июнь, 2022', style: Theme.of(context).textTheme.subtitle2),
                const Spacer(),
                SvgPicture.asset(AppIcons.vacancyItemStar),
              ],
            )
          ],
        ),
      ),
    );
  }
}
