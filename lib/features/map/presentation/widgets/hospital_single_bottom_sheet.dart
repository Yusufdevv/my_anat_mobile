import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/hospital_single/presentation/hospital_single_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class HospitalSingleBottomSheet extends StatelessWidget {
  const HospitalSingleBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(AppImages.hospitalImage),
                    ),
                    itemCount: 10,
                    separatorBuilder: (context, index) => const SizedBox(width: 8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, MediaQuery.of(context).padding.bottom + 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '7-я Центральная Семейная поликлиника',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.location),
                        const SizedBox(width: 6),
                        Text(
                          'г. Ташкент, улица Содика Азимова, 74',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.phone),
                        const SizedBox(width: 6),
                        Text(
                          '+998 71 200-70-07',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          '4,0',
                          style: Theme.of(context).textTheme.headline3!.copyWith(color: darkGreen),
                        ),
                        const SizedBox(width: 8),
                        ...List.generate(
                          4,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: SvgPicture.asset(AppIcons.star),
                          ),
                        ),
                        ...List.generate(
                          5 - 4,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: SvgPicture.asset(AppIcons.star, color: inactiveStar),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: WButton(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pushReplacement(
                                fade(
                                  page: const HospitalSingleScreen(),
                                ),
                              );
                            },
                            text: LocaleKeys.more.tr(),
                            textColor: white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        WButton(
                          width: 40,
                          color: white,
                          onTap: () {},
                          border: Border.all(color: primary),
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(AppIcons.mapRoute),
                        ),
                        const SizedBox(width: 12),
                        WButton(
                          width: 40,
                          color: white,
                          onTap: () {},
                          border: Border.all(color: primary),
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            AppIcons.boldPhone,
                            height: 17,
                            width: 17,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        WScaleAnimation(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 28,
            width: 28,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: white,
              shape: BoxShape.circle,
              border: Border.all(color: divider),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(AppIcons.close),
          ),
        )
      ],
    );
  }
}
