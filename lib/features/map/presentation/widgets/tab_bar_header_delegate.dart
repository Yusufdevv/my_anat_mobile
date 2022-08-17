import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/navigation/presentation/widgets/tab_indicator.dart';
import 'package:flutter/material.dart';

class TabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  final List<String> tabs;
  TabBarHeaderDelegate({
    required this.tabController,
    required this.tabs,
  });
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: white,
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
        indicator: const CustomTabIndicator(color: primary, radius: 3, horizontalPadding: 9, height: 3),
        tabs: tabs.map((e) => Tab(text: e)).toList(),
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
