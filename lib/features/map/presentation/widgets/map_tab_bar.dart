import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MapTabBar extends StatelessWidget {
  final MediaQueryData mediaQuery;
  final TabController tabController;
  final ValueChanged<int> onTabChanged;
  final bool isMap;
  final bool isDoctor;
  const MapTabBar({
    Key? key,
    required this.mediaQuery,
    required this.onTabChanged,
    required this.tabController,
    required this.isMap,
    required this.isDoctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        height: isMap ? 120 : 147,
        width: mediaQuery.size.width,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: isMap ? Colors.transparent : white,
          boxShadow: isMap
              ? null
              : [
                  BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 24,
                    color: woodSmoke.withOpacity(0.03),
                  ),
                ],
        ),
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (!isMap) ...{
              Text(
                /// todo localization
                isDoctor ? 'Список врачей' : 'Список организации',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 12),
            },
            Container(
              height: 40,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: white,
                // color: Colors.teal,
                boxShadow: isMap
                    ? [
                        BoxShadow(
                          offset: const Offset(0, 8),
                          blurRadius: 19,
                          color: chipShadowColor.withOpacity(0.19),
                        ),
                      ]
                    : null,
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
          ],
        ),
      ),
    );
  }
}
