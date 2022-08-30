import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/favourite_button.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item_textwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class CandidateItem extends StatelessWidget {
  final VoidCallback onTap;
  final EdgeInsets? margin;
  final CandidateListEntity candidateListEntity;

  const CandidateItem({
    required this.candidateListEntity,
    this.margin,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
        height: 145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: lilyWhite),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 129,
              width: 100,
              decoration: const BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: candidateListEntity.image.middle,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      candidateListEntity.fullName,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      candidateListEntity.specialization.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontSize: 14),
                    ),
                    const Spacer(),
                    VacancyItemTextWidget(
                        title:
                            '${candidateListEntity.workExperience} ${LocaleKeys.year.tr()}',
                        icon: AppIcons.briefCase),
                    const SizedBox(height: 4),
                    VacancyItemTextWidget(
                        title: candidateListEntity.address,
                        icon: AppIcons.mapPin),
                  ],
                ),
              ),
            ),
            // const SizedBox(width: 10),
            FavouriteButton(onTap: () {})
          ],
        ),
      ),
    );
  }
}
