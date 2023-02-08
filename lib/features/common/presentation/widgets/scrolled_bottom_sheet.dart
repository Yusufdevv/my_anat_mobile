import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScrolledBottomSheet extends StatelessWidget {
  final Widget? child;
  final List<Widget>? children;
  final Widget? pinnedChild;
  final String title;
  final bool hasHeader;
  final bool escapeBottomNavbar;
  final bool isSubScreen;
  final Widget? stackedWButton;
  final bool hasCancelButton;
  final bool hasDivider;
  final VoidCallback? onTapCancel;
  final bool applyBottomPadding;
  final bool showClear;
  final VoidCallback? onClear;

  const ScrolledBottomSheet(
      {required this.title,
      required this.hasHeader,
      this.escapeBottomNavbar = true,
      this.isSubScreen = false,
      this.hasCancelButton = true,
      this.hasDivider = true,
      this.child,
      this.children,
      this.pinnedChild,
      this.stackedWButton,
      this.applyBottomPadding = true,
      this.onTapCancel,
      this.onClear,
      this.showClear = false,
      Key? key})
      : assert(child == null || children == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasHeader)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                )),
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (showClear) ...{
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: WScaleAnimation(
                        onTap: onClear ?? () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            LocaleKeys.clean.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontSize: 12, color: primary),
                          ),
                        ),
                      ),
                    ),
                  )
                },
                if (isSubScreen)
                  WScaleAnimation(
                    onTap: onTapCancel ?? () {},
                    child: SvgPicture.asset(AppIcons.leftArrow),
                  ),
                if (isSubScreen) const SizedBox(width: 4),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                if (hasCancelButton)
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: WScaleAnimation(
                        child: SvgPicture.asset(AppIcons.bottomSheetCancel),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
              ],
            ),
          )
        else
          const SizedBox(),
        hasDivider ? const WDivider() : const SizedBox(),
        pinnedChild != null
            ? Container(
                width: double.infinity,
                color: white,
                child: pinnedChild,
              )
            : const SizedBox(),
        child != null
            ? Expanded(
                child: Container(
                  color: white,
                  child: child,
                ),
              )
            : Expanded(
                child: Container(
                  color: white,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ...children!,
                      escapeBottomNavbar
                          ? SizedBox(
                              height: MediaQuery.of(context).padding.bottom + 8,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
        stackedWButton != null
            ? Container(
                color: white,
                padding: EdgeInsets.only(
                  bottom: applyBottomPadding
                      ? MediaQuery.of(context).padding.bottom + 8
                      : 0,
                  left: 0,
                  right: 0,
                ),
                child: stackedWButton!,
              )
            : const SizedBox()
      ],
    );
  }
}
