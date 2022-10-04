import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/highlighted_text.dart';
import 'package:anatomica/features/journal/domain/entities/article_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticleItem extends StatelessWidget {
  final JournalArticleEntity magazineItemEntity;
  final EdgeInsets margin;
  final String searchString;

  const ArticleItem({required this.magazineItemEntity, this.margin = EdgeInsets.zero, this.searchString = '', Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (magazineItemEntity.isBought || !magazineItemEntity.isPremium) {
          if (await canLaunchUrlString('https://anatomica.uicgroup.tech/article/${magazineItemEntity.slug}/')) {
            await launchUrlString('https://anatomica.uicgroup.tech/article/${magazineItemEntity.slug}/',
                mode: LaunchMode.externalApplication);
          }
        } else {
          if (await canLaunchUrlString('https://anatomica.uicgroup.tech/premium-article/${magazineItemEntity.slug}/')) {
            await launchUrlString('https://anatomica.uicgroup.tech/premium-article/${magazineItemEntity.slug}/',
                mode: LaunchMode.externalApplication);
          }
        }
      },
      child: Container(
        height: 78,
        margin: margin,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: divider), borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: magazineItemEntity.image.middle,
                  fit: BoxFit.cover,
                  width: 90,
                  height: 79,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HighlightedText(
                    allText: magazineItemEntity.title,
                    highlightedText: searchString,
                    textStyle: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600),
                    textStyleHighlight: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600),
                    highlightColor: yellowHighlightedText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        magazineItemEntity.redaction,
                        style:
                            Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 3,
                        width: 3,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: textSecondary),
                      ),
                      Text(
                        MyFunctions.getPublishedDate(magazineItemEntity.publishDate),
                        style:
                            Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
