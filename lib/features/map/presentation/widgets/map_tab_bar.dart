import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MapTabBar extends StatelessWidget {
  final MediaQueryData mediaQuery;
  final TabController tabController;
  final ValueChanged<int> onTabChanged;
  const MapTabBar({
    Key? key,
    required this.mediaQuery,
    required this.onTabChanged,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      top: 16 + mediaQuery.padding.top,
      child: Container(
        height: 40,
        width: mediaQuery.size.width,
        decoration: BoxDecoration(
          color: white,
          // color: Colors.teal,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 19,
              color: chipShadowColor.withOpacity(0.19),
            ),
          ],
          border: Border.all(color: divider),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(4),
        child: Container(
          height: 36,
          decoration: BoxDecoration(
            color: textFieldColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(2),
          child: TabBar(
            controller: tabController,
            padding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            indicator: BoxDecoration(color: white, borderRadius: BorderRadius.circular(6), boxShadow: [
              BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 24,
                color: chipShadowColor.withOpacity(0.19),
              ),
            ]),
            labelPadding: EdgeInsets.zero,
            labelStyle: Theme.of(context).textTheme.displaySmall,
            labelColor: textColor,
            onTap: onTabChanged,
            unselectedLabelColor: textSecondary,
            tabs: [
              Tab(text: LocaleKeys.organization.tr()),
              Tab(text: LocaleKeys.doctor.tr()),
            ],
          ),
        ),
      ),
    );
  }
}
