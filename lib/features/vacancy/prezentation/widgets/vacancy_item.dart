import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/favourite_button_vacancy.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/image_card.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item_textwidget.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VacancyItem extends StatelessWidget {
  final EdgeInsets? margin;
  final VoidCallback onTap;
  final VacancyListEntity vacancyEntity;

  const VacancyItem({
    required this.vacancyEntity,
    this.margin,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vacancyEntity.title,
                        style: Theme.of(context).textTheme.headline1!.copyWith(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        vacancyEntity.organization.title,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                ImageCard(imageUrl: vacancyEntity.organization.logo.middle)
              ],
            ),
            const SizedBox(height: 20),
            VacancyItemTextWidget(
                title: '${vacancyEntity.experienceFrom} - ${vacancyEntity.experienceTo} лет', icon: AppIcons.briefCase),
            const SizedBox(height: 4),
            VacancyItemTextWidget(title: vacancyEntity.address, icon: AppIcons.mapPin),
            const SizedBox(height: 4),
            VacancyItemTextWidget(
                title:
                    '${MyFunctions.getPriceFormat(vacancyEntity.salaryFrom)} - ${MyFunctions.getPriceFormat(vacancyEntity.salaryTo)}',
                icon: AppIcons.cashBanknote),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(LocaleKeys.published.tr(), style: Theme.of(context).textTheme.subtitle2),
                const SizedBox(width: 4),
                Text(MyFunctions.getPublishedDate(vacancyEntity.publishedAt),
                    style: Theme.of(context).textTheme.subtitle2),
                const Spacer(),
                FavouriteButtonVacancy(vacancy: vacancyEntity),
              ],
            )
          ],
        ),
      ),
    );
  }
}
