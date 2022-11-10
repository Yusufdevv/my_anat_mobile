import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/journal/domain/entities/article_entity.dart';
import 'package:anatomica/features/web_view/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../navigation/presentation/navigator.dart';

class HospitalArticleItem extends StatelessWidget {
  final JournalArticleEntity entity;
  final bool showShadow;
  const HospitalArticleItem({
    this.showShadow = true,
    required this.entity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () async {
            if (state.status == AuthenticationStatus.authenticated) {
              if (!entity.isPremium) {
                Navigator.of(context, rootNavigator: true).push(
                  fade(
                    page: WebViewScreen(
                      page: 'ArticleSinglePage',
                      slug: entity.slug,
                    ),
                  ),
                );
              } else {
                Navigator.of(context, rootNavigator: true).push(
                  fade(
                    page: WebViewScreen(
                      page: 'PremiumArticleSinglePage',
                      slug: entity.slug,
                    ),
                  ),
                );
              }
            } else {
              if (!entity.isPremium) {
                Navigator.of(context, rootNavigator: true).push(
                  fade(
                    page: WebViewScreen(
                      url: 'https://anatomica.uz/article/${entity.slug}',
                      page: '',
                    ),
                  ),
                );
              } else {
                Navigator.of(context, rootNavigator: true).push(
                  fade(
                    page: WebViewScreen(
                      url: 'https://anatomica.uz/premium-article/${entity.slug}',
                      page: '',
                    ),
                  ),
                );
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: textFieldColor,
              ),
              boxShadow: showShadow
                  ? [
                      BoxShadow(
                        color: darkerGreen.withOpacity(0.09),
                        offset: const Offset(0, 8),
                        blurRadius: 24,
                      )
                    ]
                  : [],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    entity.image.middle,
                    errorBuilder: (a, b, c) => const SizedBox(
                      width: 82,
                      height: 100,
                    ),
                    height: 100,
                    width: 82,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        entity.title,
                        style: Theme.of(context).textTheme.headline1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.mapCalendar),
                          const SizedBox(width: 6),
                          Text(
                            MyFunctions.safeDateFormat(entity.publishDate, 'dd MMMM yyyy'),
                            style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
