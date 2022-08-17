import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
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
  final WButton? stackedWButton;
  final bool hasCancelButton;

  const ScrolledBottomSheet(
      {required this.title,
      required this.hasHeader,
      this.escapeBottomNavbar = true,
      this.isSubScreen = false,
      this.hasCancelButton = true,
      this.child,
      this.children,
      this.pinnedChild,
      this.stackedWButton,
      Key? key})
      : assert(child == null || children == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            hasHeader
                ? SliverToBoxAdapter(
                    child: Container(
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
                          if (isSubScreen)
                            WScaleAnimation(
                              child: SvgPicture.asset(AppIcons.leftArrow),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          if (isSubScreen) const SizedBox(width: 4),
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                          if (hasCancelButton)
                            WScaleAnimation(
                              child: SvgPicture.asset(AppIcons.bottomSheetCancel),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                        ],
                      ),
                    ),
                  )
                : const SliverToBoxAdapter(child: SizedBox()),
            const SliverToBoxAdapter( child: WDivider()),
            pinnedChild != null
                ? SliverToBoxAdapter(
                    child: Container(
                      width: double.infinity,
                      color: white,
                      child: pinnedChild,
                    ),
                  )
                : const SliverToBoxAdapter(child: SizedBox()),
            child != null
                ? SliverFillRemaining(
                    child: Container(
                      color: white,
                      child: child,
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Container(
                      color: white,
                      child: ListView(
                        shrinkWrap: true,
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
          ],
        ),
        stackedWButton != null
            ? Positioned(
                bottom: MediaQuery.of(context).padding.bottom + 8,
                left: 0,
                right: 0,
                child: stackedWButton!,
              )
            : const SizedBox(),
      ],
    );
  }
}
