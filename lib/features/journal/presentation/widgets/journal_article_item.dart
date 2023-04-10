import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/markdown_reader/presentation/pages/journal_markdown_reader.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class JournalArticleItem extends StatelessWidget {
  const JournalArticleItem({
    required this.price,
    required this.title,
    required this.imageUrl,
    required this.slug,
    Key? key,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final String slug;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 161,
      padding: const EdgeInsets.symmetric(horizontal: 16)
          .copyWith(top: 16, bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: divider),
                borderRadius: BorderRadius.circular(8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                height: 120,
                width: 120,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  MyFunctions.getFormatCostFromInt(price),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 20),
                ),
                const Spacer(),
                WButton(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                      fade(
                        page: JournalMarkdownPageReader(
                          title: title,
                          slug: slug,
                          isPreview: true,
                        ),
                      ),
                    );
                  },
                  height: 40,
                  text: LocaleKeys.read_snippet.tr(),
                  textColor: primary,
                  color: unFollowButton.withOpacity(0.1),
                  border: Border.all(color: primary),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
