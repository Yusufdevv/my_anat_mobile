import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/highlighted_text.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/favourite_button_candidate.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item_textwidget.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CandidateItem extends StatelessWidget {
  final VoidCallback onTap;
  final EdgeInsets? margin;
  final CandidateListEntity candidateListEntity;
  final String searchText;

  const CandidateItem({
    required this.candidateListEntity,
    this.margin,
    required this.onTap,
    this.searchText = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                  errorWidget: (_, __, ___) =>
                      SvgPicture.asset(AppIcons.smallImageError),
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
                      style: Theme.of(context).textTheme.displayLarge,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    HighlightedText(
                      allText: candidateListEntity.position,
                      textStyle: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      highlightedText: searchText,
                      textStyleHighlight: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: 14, color: white),
                      highlightColor: tongerineYellow,
                      maxLines: 1,
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
            FavouriteButtonCandidate(
              candidate: candidateListEntity,
            )
          ],
        ),
      ),
    );
  }
}
