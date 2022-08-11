import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CandidateSingleAppBar extends StatelessWidget {
  const CandidateSingleAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Stack(
      children: [
        SizedBox(
          height: 440,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://images.unsplash.com/photo-1503104834685-7205e8607eb9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z2lybHN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            darkGreen,
                            darkGreen.withOpacity(0),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  height: 155,
                  decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.mapPin,
                              color: textSecondary, height: 18, width: 18),
                          const SizedBox(width: 6),
                          Text(
                            'г. Ташкент, улица Содика Азимова, 74',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.phone,
                              color: textSecondary, height: 18, width: 18),
                          const SizedBox(width: 6),
                          Text(
                            '+998 71 200-70-07',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            '4,0',
                            style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 14),
                          ),
                          const SizedBox(width: 8),
                          ...List.generate(
                            5,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: SvgPicture.asset(AppIcons.star),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      WButton(
                        borderRadius: 6,
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.phone),
                            const SizedBox(width: 8),
                            Text(
                              'Позвонить',
                              style: Theme.of(context).textTheme.headline2!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 16 + mediaQuery.padding.top,
          right: 16,
          left: 16,
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WScaleAnimation(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(AppIcons.chevronLeft),
                  ),
                  WScaleAnimation(
                    onTap: () {},
                    child: SvgPicture.asset(AppIcons.share),
                  ),
                ],
              ),
              const SizedBox(height: 110),
              Text(
                "Иргашев Дильмурад \nСаатович",
                style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 16),
              WScaleAnimation(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
                  height: 31,
                  width: 126,
                  decoration: BoxDecoration(
                      color: white.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: primary)),
                  child: Text(
                    'Репродуктолог',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
