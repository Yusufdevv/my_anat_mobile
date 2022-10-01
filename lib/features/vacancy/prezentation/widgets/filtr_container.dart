import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterContainer extends StatelessWidget {
  final VoidCallback onTap;
  final double? margin;
  const FilterContainer({required this.onTap, this.margin = 0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(16, margin!, 16, 0),
        padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: pattensBlue),
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.filter),
            const SizedBox(width: 12),
            Text(LocaleKeys.filter.tr()),
            const Spacer(),
            SvgPicture.asset(AppIcons.arrowRight)
          ],
        ),
      ),
    );
  }
}
