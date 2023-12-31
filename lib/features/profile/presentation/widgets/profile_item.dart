import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String? icon;
  final VoidCallback onTap;
  final Color color;
  final Color? iconColor;
  final String? image;
  final Color? titleColor;

  const ProfileItem(
      {required this.onTap,
      this.color = clearDay,
      this.iconColor,
      this.titleColor,
      required this.title,
      this.icon,
      this.image,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: color,
              ),
              child: icon == null
                  ? Image.asset(image!)
                  : SvgPicture.asset(icon!, color: iconColor),
            ),
            const SizedBox(width: 12),
            Text(
              title.tr(),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: titleColor),
            ),
            const Spacer(),
            SvgPicture.asset(AppIcons.arrowRight, color: textSecondary)
          ],
        ),
      ),
    );
  }
}
