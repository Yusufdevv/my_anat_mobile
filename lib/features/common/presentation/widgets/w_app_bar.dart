import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBackButton;
  final VoidCallback? onTapBack;
  final String? title;
  final Widget? child;
  final TextStyle? titleStyle;
  final List<Widget> extraActions;
  final Color? backgroundColor;
  final String? backgroundAsset;
  final double? bottomRadius;
  final bool filledBackButton;
  final double? topMargin;
  final bool hasUnderline;
  final double? height;
  final Color? underlineColor;

  final List<BoxShadow>? boxShadow;

  ///Default is set true
  final bool centerTitle;

  const WAppBar({
    Key? key,
    this.bottomRadius,
    this.topMargin,
    this.underlineColor,
    this.hasUnderline = false,
    this.filledBackButton = false,
    this.backgroundAsset,
    this.child,
    this.onTapBack,
    this.backgroundColor,
    this.hasBackButton = true,
    this.title,
    this.titleStyle,
    this.extraActions = const [],
    this.centerTitle = true,
    this.boxShadow,
    this.height,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height ?? 53);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: (height ?? 52) + MediaQuery.of(context).padding.top,
          padding: EdgeInsets.only(
              left: 0,
              top: (topMargin ?? 0) + MediaQuery.of(context).padding.top),
          decoration: BoxDecoration(
            boxShadow: boxShadow,
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(bottomRadius ?? 0),
              bottomRight: Radius.circular(bottomRadius ?? 0),
            ),
            image: backgroundAsset != null && backgroundAsset!.isNotEmpty
                ? DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(backgroundAsset!),
                  )
                : null,
          ),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hasBackButton
                      ? Align(
                          alignment: Alignment.center,
                          child: WScaleAnimation(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: SvgPicture.asset(AppIcons.arrowLeft,
                                  color: black, height: 24, width: 24),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const Spacer(),
                  ...List.of(extraActions)
                ],
              ),
              child != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [child!],
                    )
                  : Row(
                      mainAxisAlignment: centerTitle
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            title ?? '',
                            style: titleStyle ??
                                Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        )
                      ],
                    )
            ],
          ),
        ),
        hasUnderline
            ? Container(
                height: 1,
                color: underlineColor ?? lilyWhite,
              )
            : const SizedBox()
      ],
    );
  }
}
