import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegionItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const RegionItem({this.title = 'Андижанская область', required this.onTap, Key? key}) : super
      (key:
    key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WScaleAnimation(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                title,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline1!
                    .copyWith(),
              ),
              const Spacer(),
              SvgPicture.asset(AppIcons.arrowRight)
            ],
          ),
        ),
        const SizedBox(height: 16),
        const WDivider()
      ],
    );
  }
}
