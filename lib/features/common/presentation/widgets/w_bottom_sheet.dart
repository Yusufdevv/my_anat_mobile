import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WBottomSheet extends StatelessWidget {
  final double borderRadius;
  final List<Widget> children;
  final Widget? bottomNavigation;
  final double? height;
  final EdgeInsets? contentPadding;
  final Color? bottomsheetBackground;

  const WBottomSheet({
    required this.children,
    this.borderRadius = 16,
    this.height,
    this.bottomNavigation,
    this.contentPadding,
    this.bottomsheetBackground,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: bottomsheetBackground ?? white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(borderRadius),
                    ),
                  ),
                  padding: contentPadding ??
                      EdgeInsets.fromLTRB(
                        20,
                        16,
                        20,
                        bottomNavigation == null ? MediaQuery.of(context).padding.bottom + 16 : 0,
                      ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
                ),
                Positioned(
                    top: 12,
                    right: 16,
                    child: WScaleAnimation(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          padding: const EdgeInsets.all(6),
                          height: 28,
                          width: 28,
                          decoration: const BoxDecoration(
                            color: lilyWhite,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(AppIcons.cancelX)),
                    ))
              ],
            ),
            if (bottomNavigation != null) ...{
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 20,
                ),
                child: bottomNavigation,
              ),
            }
          ],
        ),
      );
}
