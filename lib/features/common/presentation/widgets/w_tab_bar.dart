import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class WTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Widget> tabs;

  const WTabBar({required this.tabController, required this.tabs, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      decoration: BoxDecoration(
        color: lilyWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 36,
      child: TabBar(
        padding: const EdgeInsets.all(2),
        indicator: ShapeDecoration(
          shadows: [
            BoxShadow(
                blurRadius: 1,
                offset: const Offset(0, 3),
                color: const Color(0xff000000).withOpacity(0.04)),
            BoxShadow(
                blurRadius: 8,
                offset: const Offset(0, 3),
                color: const Color(0xff000000).withOpacity(0.12)),
          ],
          shape: RoundedRectangleBorder(
              side: BorderSide(color: const Color(0xff000000).withOpacity(0.04)),
              borderRadius: BorderRadius.circular(7)),
          color: Colors.white,
        ),
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        onTap: (s) {},
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
        labelStyle: Theme.of(context).textTheme.headline1!.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
        unselectedLabelColor: textSecondary,
        labelColor: black,
        tabs: tabs,
      ),
    );
  }
}
