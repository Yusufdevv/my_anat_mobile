import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/home/presentation/blocs/news_bloc/news_bloc.dart';
import 'package:anatomica/features/home/presentation/parts/new_single_screen.dart';
import 'package:anatomica/features/journal/presentation/pages/journal_article_single.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsItem extends StatelessWidget {
  final String image;
  final String title;
  final String createdAt;
  final String slug;
  final NewsBloc newsBloc;

  const NewsItem({
    required this.title,
    required this.createdAt,
    required this.image,
    required this.slug,
    required this.newsBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(fade(page: NewSingleScreen(bloc: newsBloc, slug: slug)));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: textFieldColor,
          ),
          boxShadow: [
            BoxShadow(
              color: darkerGreen.withOpacity(0.09),
              offset: const Offset(0, 8),
              blurRadius: 24,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image,
                errorBuilder: (a, b, c) => const SizedBox(
                  width: 82,
                  height: 82,
                ),
                height: 82,
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
                    title,
                    style: Theme.of(context).textTheme.displayLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.mapCalendar),
                      const SizedBox(width: 6),
                      Text(
                        MyFunctions.safeDateFormat(createdAt, 'dd MMMM yyyy'),
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 13),
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
  }
}
