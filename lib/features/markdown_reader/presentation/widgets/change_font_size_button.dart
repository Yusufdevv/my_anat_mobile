import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangeFontSizeButton extends StatelessWidget {
  final String icon;
  final Color? iconColor;
  final VoidCallback onTap;
  const ChangeFontSizeButton({
    required this.onTap,
    required this.icon,
    this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: WScaleAnimation(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            height: 34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: divider),
            ),
            child: SvgPicture.asset(
              icon,
              color: iconColor,
            ),
          ),
        ),
      );
}
