import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/highlighted_text.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:anatomica/features/hospital_single/presentation/hospital_single_screen.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HospitalItem extends StatelessWidget {
  final OrgMapV2Model entity;
  final bool isSuggestionItem;
  final String searchText;

  const HospitalItem({required this.entity, this.isSuggestionItem = false, this.searchText = '', Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .push(fade(page: HospitalSingleScreen(slug: entity.slug, id: entity.id)));
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(offset: const Offset(0, 8), blurRadius: 24, color: darkerGreen.withOpacity(0.09)),
          ],
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: white, border: Border.all(color: textFieldColor), borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 140,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: entity.images.isNotEmpty
                          ? ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: entity.images.length,
                              separatorBuilder: (context, index) => const SizedBox(width: 8),
                              itemBuilder: (context, index) => ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: WImage(
                                  imageUrl: entity.images[index].middle,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.shortestSide / 2,
                                  onErrorWidget: SvgPicture.asset(
                                    AppIcons.bigImageError,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(8), color: errorImageBackground),
                              child: SvgPicture.asset(
                                AppIcons.logo,
                                height: 100,
                                color: textFieldColor,
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 12, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(color: divider),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: WImage(
                                height: 32,
                                width: 32,
                                imageUrl: entity.logo.middle,
                                borderRadius: BorderRadius.circular(6),
                                onErrorWidget: SvgPicture.asset(AppIcons.smallImageError, fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: isSuggestionItem
                                  ? HighlightedText(
                                      allText: entity.title,
                                      highlightedText: searchText,
                                      highlightColor: tongerineYellow,
                                      textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textStyleHighlight:
                                          Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14),
                                    )
                                  : Text(
                                      entity.title,
                                      style: Theme.of(context).textTheme.displayLarge,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(entity.address,
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: textSecondary),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                        if (isSuggestionItem) ...[
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: List.generate(
                                entity.specialization.length,
                                (index) => SpecilaizationItem(
                                    allText: entity.specialization[index].title,
                                    highlightedText: searchText,
                                    fenceColor: index == 0 ? darkGreen : gold2)),
                          )
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (entity.rating != 0) ...{
              Positioned(
                top: 16,
                left: -12,
                child: Container(
                  height: 30,
                  padding: const EdgeInsets.fromLTRB(12, 0, 4, 0),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: textFieldColor),
                    boxShadow: [
                      BoxShadow(offset: const Offset(0, 8), blurRadius: 24, color: chipShadowColor.withOpacity(0.19))
                    ],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 4),
                      SvgPicture.asset(
                        AppIcons.star,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        entity.rating.toString(),
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(color: black, fontSize: 13),
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
                ),
              )
            },
            if (entity.distance != 0) ...{
              Positioned(
                top: 16,
                right: -12,
                child: Container(
                  height: 30,
                  padding: const EdgeInsets.fromLTRB(8, 0, 12, 0),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: textFieldColor),
                      boxShadow: [
                        BoxShadow(offset: const Offset(0, 8), blurRadius: 24, color: chipShadowColor.withOpacity(0.19))
                      ]),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.locationGreen, height: 16, width: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${entity.distance.toStringAsFixed(1)} КМ',
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(color: black, fontSize: 13),
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
                ),
              )
            }
          ],
        ),
      ),
    );
  }
}

class SpecilaizationItem extends StatelessWidget {
  const SpecilaizationItem({
    required this.allText,
    required this.highlightedText,
    required this.fenceColor,
    super.key,
  });

  final String allText;
  final String highlightedText;
  final Color fenceColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: lilyWhite,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: lilyWhite),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('#', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: fenceColor)),
          const SizedBox(width: 4),
          HighlightedText(
            allText: allText,
            highlightColor: tacao,
            highlightedText: highlightedText,
            textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: textColor),
            textStyleHighlight: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: textColor),
          ),
        ],
      ),
    );
  }
}
