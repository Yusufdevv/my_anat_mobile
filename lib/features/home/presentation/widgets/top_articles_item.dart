import 'dart:ui';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopArticlesItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;
  final int id;
  final String createdAt;
  final bool isPremium;

  const TopArticlesItem(
      {required this.imageUrl,
      required this.id,
      required this.title,
      required this.createdAt,
      required this.category,
      this.isPremium = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 223,
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: lilyWhite,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: darkerGreen.withOpacity(0.09),
            offset: const Offset(0, 8),
            blurRadius: 24,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Offstage(
            offstage: !isPremium,
            child: Container(
              height: 24,
              width: 24,
              margin: const EdgeInsets.fromLTRB(0, 8, 8, 0),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: gold,
                borderRadius: BorderRadius.circular(150),
                boxShadow: [
                  BoxShadow(
                    color: textColor.withOpacity(0.16),
                    offset: const Offset(2, 6),
                    blurRadius: 18,
                  )
                ],
              ),
              child: SvgPicture.asset(AppIcons.diamond),
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(12)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      height: 100,
                      width: 223,
                      color: textColor.withOpacity(0.4),
                      padding: const EdgeInsets.only(left: 16, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            createdAt,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: divider),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -10,
                left: 16,
                child: Chip(
                  label: Text(
                    category,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: white),
                  ),
                  elevation: 0,
                  backgroundColor: primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
