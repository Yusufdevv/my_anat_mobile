import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtherProfileItem extends StatelessWidget {
  final Color? backgroundColor;
  final String? title;
  final Color? iconBackgroundColor;
  final String? icon;
  final VoidCallback onTap;

  const OtherProfileItem(
      {this.icon, this.title, this.backgroundColor, this.iconBackgroundColor, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor ?? frostedMint,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: iconBackgroundColor ?? mediumSeaGreen,
              ),
              child: SvgPicture.asset(icon ?? AppIcons.medicalDoctor),
            ),
            const SizedBox(width: 12),
            Text(
              title ?? LocaleKeys.get_doctor.tr(),
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
