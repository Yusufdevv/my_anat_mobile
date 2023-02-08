import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/highlighted_text.dart';
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
  final String searchText;

  const VacancyItem({
    required this.vacancyEntity,
    this.margin,
    required this.onTap,
    this.searchText = '',
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
          color: white,
          boxShadow: [
            BoxShadow(
              color: darkerGreen.withOpacity(0.09),
              offset: const Offset(0, 8),
              blurRadius: 24,
            ),
          ],
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
                      HighlightedText(
                        allText: vacancyEntity.title,
                        textStyle: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(),
                        highlightedText: searchText,
                        overflow: TextOverflow.ellipsis,
                        textStyleHighlight:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: white,
                                ),
                        maxLines: 2,
                        highlightColor: tongerineYellow,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        vacancyEntity.organization.title,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
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
                title:
                    '${vacancyEntity.experienceFrom} - ${vacancyEntity.experienceTo} ${LocaleKeys.year.tr()}',
                icon: AppIcons.briefCase),
            const SizedBox(height: 4),
            VacancyItemTextWidget(
                title: vacancyEntity.address, icon: AppIcons.mapPin),
            const SizedBox(height: 4),
            VacancyItemTextWidget(
                title:
                    '${MyFunctions.getPriceFormat(vacancyEntity.salaryFrom)} - ${MyFunctions.getPriceFormat(vacancyEntity.salaryTo)}',
                icon: AppIcons.cashBanknote),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(LocaleKeys.published.tr(),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: 4),
                Text(MyFunctions.getPublishedDate(vacancyEntity.publishedAt),
                    style: Theme.of(context).textTheme.titleSmall),
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
