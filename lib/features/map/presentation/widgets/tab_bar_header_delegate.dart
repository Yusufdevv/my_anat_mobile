import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/navigation/presentation/widgets/tab_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  final List<String> tabs;
  final ValueChanged<int>? onTabTap;
  TabBarHeaderDelegate({
    required this.tabController,
    required this.tabs,
    this.onTabTap,
  });
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 24,
            color: darkerGreen.withOpacity(0.08),
          ),
        ],
        color: white,
      ),
      child: TabBar(
        controller: tabController,
        labelStyle: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 15),
        labelColor: darkGreen,
        labelPadding: const EdgeInsets.symmetric(horizontal: 9),
        physics: const BouncingScrollPhysics(),
        isScrollable: true,
        padding: const EdgeInsets.symmetric(horizontal: 7),
        unselectedLabelColor: textColor,
        indicatorColor: primary,
        onTap: onTabTap,
        indicator: const CustomTabIndicator(color: primary, radius: 3, horizontalPadding: 9, height: 3),
        tabs: tabs.map((e) => Tab(text: e.tr())).toList(),
      ),
    );
  }

  @override
  double get maxExtent => 46;

  @override
  double get minExtent => 46;

  @override
  bool shouldRebuild(covariant TabBarHeaderDelegate oldDelegate) => oldDelegate.tabController != tabController;
}
