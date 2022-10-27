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
    this.backgroundColor = white,
    this.titleColor = textColor,
  }) : super(key: key);
  final String title;
  final Widget buttons;
  final Color backgroundColor;
  final Color titleColor;
  final VoidCallback? onTitleTap;
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
                offset: const Offset(-1, 4),
                blurRadius: 20,
                // spreadRadius: -1.0,
                color: divider.withOpacity(0.08)),
          ],
        ),
        // height: kToolbarHeight,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: kToolbarHeight,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                ),
                padding: const EdgeInsets.all(18),
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
                          color: textSecondary,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    buttons,
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTitleTap,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline3!.copyWith(color: titleColor),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Divider(
                  height: 0,
                  color: appBarDivider,
                  thickness: 1,
                ),
              )
            ],
          ),
        ),
      );

  @override
  Size get preferredSize => const Size(double.infinity, 100);
}
