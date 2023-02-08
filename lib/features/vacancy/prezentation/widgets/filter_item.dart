import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const FilterItem({this.title = '', required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: lilyWhite),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(),
            ),
            const Spacer(),
            SvgPicture.asset(AppIcons.arrowRight, color: textSecondary),
          ],
        ),
      ),
    );
  }
}
