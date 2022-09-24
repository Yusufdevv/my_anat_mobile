import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const SettingItem({required this.onTap, this.title = '', this.icon = '', Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        height: 52,
        color: white,
        child: Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const Spacer(),
            SizedBox(height: 36, width: 36, child: SvgPicture.asset(icon)),
            const SizedBox(width: 4),
            SvgPicture.asset(AppIcons.arrowRight, color: textSecondary),
          ],
        ),
      ),
    );
  }
}
