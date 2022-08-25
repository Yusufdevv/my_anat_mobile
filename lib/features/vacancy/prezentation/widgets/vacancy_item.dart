import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/favourite_button.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/image_card.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item_textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';

class VacancyItem extends StatelessWidget {
  final EdgeInsets? margin;
  final VoidCallback onTap;
  final VacancyListEntity vacancyEntity;

  const VacancyItem({required this.vacancyEntity, this.margin, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
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
                title: '${vacancyEntity.experienceFrom} - ${vacancyEntity.experienceTo} лет',
                icon: AppIcons.briefCase),
            const SizedBox(height: 4),
            VacancyItemTextWidget(title: vacancyEntity.address, icon: AppIcons.mapPin),
            const SizedBox(height: 4),
            VacancyItemTextWidget(
                title: '${vacancyEntity.salaryFrom} - ${vacancyEntity.salaryTo}',
                icon: AppIcons.cashBanknote),
            const SizedBox(height: 12),
            Row(
              children: [
                Text('Опубликовано:', style: Theme.of(context).textTheme.subtitle2),
                const SizedBox(width: 4),
                Text(Jiffy(vacancyEntity.publishedAt).format('dd MMMM , yyyy'),
                    style: Theme.of(context).textTheme.subtitle2),
                const Spacer(),
                FavouriteButton(
                  isFavourite: vacancyEntity.isFavorite,
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
