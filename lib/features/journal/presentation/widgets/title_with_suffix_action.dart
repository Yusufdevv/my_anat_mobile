import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleWithSuffixAction extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TitleWithSuffixAction({
    required this.onTap,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style:
              Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 24),
        ),
        const Spacer(),
        WScaleAnimation(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  LocaleKeys.all.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 15),
                ),
                SvgPicture.asset(AppIcons.arrowRight)
              ],
            ),
          ),
        )
      ],
    );
  }
}
