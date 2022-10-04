import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class FirstArticle extends StatelessWidget {
  final JournalState state;
  const FirstArticle({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16).copyWith(top: 0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 0, bottom: 16),
                    height: 188,
                    decoration:
                        BoxDecoration(border: Border.all(color: divider), borderRadius: BorderRadius.circular(8)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        imageUrl: state.firstArticle.image.middle,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.firstArticle.title,
                      style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 4),  
                  Html(
                    data: state.firstArticle.shortDescription,
                    style: {
                      'p': Style(
                        fontSize:  FontSize(13),
                        padding: EdgeInsets.zero,

                        color: textSecondary,
                      )
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
