import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HospitalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final MediaQueryData mediaQuery;
  final TabController controller;
  const HospitalAppBar({Key? key, required this.mediaQuery, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16, top: mediaQuery.padding.top + 8),
      decoration: BoxDecoration(
        color: textFieldColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TabBar(
        controller: controller,
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
        onTap: (index) {},
        unselectedLabelColor: textSecondary,
        tabs: [
          Tab(text: LocaleKeys.organization.tr()),
          Tab(text: LocaleKeys.doctor.tr()),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(mediaQuery.size.width, mediaQuery.padding.top + 56);
}
