import 'package:flutter/material.dart';

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final Color color;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? tabBarMargin;
  final double? height;
  final bool hasRadius;
  final bool hasShadow;

  const SliverTabBarDelegate({
    required this.color,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.hasRadius = false,
    this.hasShadow = false,
    this.tabBarMargin,
    this.height,
  });

  @override
  bool shouldRebuild(covariant SliverTabBarDelegate oldDelegate) =>
      child != oldDelegate.child ||
      color != oldDelegate.color ||
      backgroundColor != oldDelegate.backgroundColor ||
      tabBarMargin != oldDelegate.tabBarMargin ||
      hasRadius != oldDelegate.hasRadius ||
      hasShadow != oldDelegate.hasShadow ||
      height != oldDelegate.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => Container(
        padding: padding ?? const EdgeInsets.only(bottom: 0, left: 0, right: 0),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            // BoxShadow(
            //     color: const Color(0xff000000).withOpacity(0.1), blurRadius: 3)
          ],
        ),
        child: Container(
          height: height ?? 80,
          margin: tabBarMargin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(hasRadius ? 16 : 0),
            color: color,
          ),
          child: child,
        ),
      );

  @override
  double get maxExtent => height ?? 80;

  @override
  double get minExtent => height ?? 80;
}
