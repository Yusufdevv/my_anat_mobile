import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WAppBarWithButtons extends StatelessWidget implements PreferredSizeWidget {
  const WAppBarWithButtons({
    required this.title,
    Key? key,
    this.buttons = const SizedBox.shrink(),
    this.onTitleTap,
  }) : super(key: key);
  final String title;
  final Widget buttons;
  final VoidCallback? onTitleTap;
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(-1, 4),
                blurRadius: 20,
                // spreadRadius: -1.0,
                color: divider.withOpacity(0.08)),
          ],
        ),
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WScaleAnimation(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 50,
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      AppIcons.chevronLeft,
                      width: 22,
                      height: 22,
                      color: grey,
                      fit: BoxFit.none,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: onTitleTap,
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primary,
                          overflow: TextOverflow.ellipsis),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                buttons,
              ],
            ),
          ),
        ),
      );

  @override
  Size get preferredSize => const Size(double.infinity, 100);
}
