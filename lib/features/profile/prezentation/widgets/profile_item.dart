import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  final Color color;
  final Color? iconColor;

  const ProfileItem(
      {required this.onTap,
      this.color = clearDay,
      this.iconColor,
      required this.title,
      required this.icon,
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
              child: SvgPicture.asset(icon, color: iconColor),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.headline1!.copyWith(),
            ),
            const Spacer(),
            SvgPicture.asset(AppIcons.arrowRight, color: textSecondary)
          ],
        ),
      ),
    );
  }
}
