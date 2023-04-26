import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuySubscriptionAppBarTitle extends StatelessWidget {
  const BuySubscriptionAppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WScaleAnimation(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: SvgPicture.asset(AppIcons.chevronLeft, color: textSecondary),
          ),
        ),
        Text(
          LocaleKeys.activate_subscription.tr(),
          style: Theme.of(context).textTheme.displaySmall!.copyWith(color: textColor, fontSize: 20),
        ),
        const SizedBox(width: 56),
      ],
    );
  }
}
