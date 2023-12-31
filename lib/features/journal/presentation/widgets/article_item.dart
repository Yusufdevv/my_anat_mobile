import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/highlighted_text.dart';
import 'package:anatomica/features/journal/domain/entities/article_entity.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/web_view/web_view_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleItem extends StatelessWidget {
  final JournalArticleEntity magazineItemEntity;
  final EdgeInsets margin;
  final String searchString;

  const ArticleItem(
      {required this.magazineItemEntity,
      this.margin = EdgeInsets.zero,
      this.searchString = '',
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        final List list = magazineItemEntity.authors;
        list.removeWhere((element) => element == null);
        final String authors = list.join(", ");
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            if (state.status == AuthenticationStatus.authenticated) {
              if (!magazineItemEntity.isPremium ||
                  magazineItemEntity.isBought) {
                Navigator.of(context, rootNavigator: true).push(
                  fade(
                    page: WebViewScreen(
                      url:
                          'https://anatomica.uz/articles/${magazineItemEntity.slug}',
                      shareValue:
                          'https://anatomica.uz/articles/${magazineItemEntity.slug}',
                      page: 'ArticleSinglePage',
                      slug: magazineItemEntity.slug,
                    ),
                  ),
                );
              } else {
                Navigator.of(context, rootNavigator: true).push(
                  fade(
                    page: WebViewScreen(
                      shareValue:
                          'https://anatomica.uz/premium-article/${magazineItemEntity.slug}',
                      page: 'PremiumArticleSinglePage',
                      slug: magazineItemEntity.slug,
                    ),
                  ),
                );
              }
            } else {
              if (magazineItemEntity.isPremium) {
                Navigator.of(context, rootNavigator: true).push(
                  fade(
                    page: WebViewScreen(
                      sendToken: false,
                      shareValue:
                          'https://anatomica.uz/premium-article/${magazineItemEntity.slug}',
                      url:
                          'https://anatomica.uz/premium-article/${magazineItemEntity.slug}',
                      page: 'PremiumArticleSinglePage',
                      slug: magazineItemEntity.slug,
                    ),
                  ),
                );
              } else {
                Navigator.of(context, rootNavigator: true).push(
                  fade(
                    page: WebViewScreen(
                      sendToken: false,
                      shareValue:
                          'https://anatomica.uz/articles/${magazineItemEntity.slug}',
                      url:
                          'https://anatomica.uz/articles/${magazineItemEntity.slug}',
                      page: 'ArticleSinglePage',
                      slug: magazineItemEntity.slug,
                    ),
                  ),
                );
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
                  decoration: BoxDecoration(
                      border: Border.all(color: divider),
                      borderRadius: BorderRadius.circular(8)),
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
                        textStyle: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                        textStyleHighlight: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                        highlightColor: yellowHighlightedText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: Visibility(
                                visible: authors.isNotEmpty,
                                child: Text(
                                  authors,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            WidgetSpan(
                              child: Visibility(
                                visible: authors.isNotEmpty,
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  height: 3,
                                  width: 3,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: textSecondary),
                                ),
                              ),
                              alignment: PlaceholderAlignment.middle,
                            ),
                            TextSpan(
                              text: MyFunctions.getPublishedDate(
                                  magazineItemEntity.publishDate),
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      const Divider(height: 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
