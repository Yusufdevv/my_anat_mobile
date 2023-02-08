import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeviceItem extends StatelessWidget {
  final String? icon;
  final Color? iconColor;
  final Color? color;
  final VoidCallback onTap;

  const DeviceItem(
      {required this.onTap, this.icon, this.iconColor, this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.fromLTRB(0, 8, 16, 8),
        height: 52,
        color: white,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: color ?? primary,
              ),
              child: SvgPicture.asset(
                icon ?? AppIcons.mobileDevice,
                color: iconColor ?? white,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              children: [
                Text(
                  'Samsung Galaxy A8 2018',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Anatomica App v.2.1 (Android)',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
