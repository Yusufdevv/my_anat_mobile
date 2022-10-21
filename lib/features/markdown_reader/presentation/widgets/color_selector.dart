import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ColorSelector extends StatelessWidget {
  final Color color;
  final Function(Color, Color) onTap;
  final Color value;
  final Color groupValue;

  const ColorSelector({
    required this.color,
    required this.value,
    required this.groupValue,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: WScaleAnimation(
          onTap: () => onTap(value, color.red > 200 ? textColor : white),
          child: Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color: divider.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: value == groupValue
                ? SvgPicture.asset(
                    AppIcons.readerCheck,
                    color: color.red > 200 ? textColor : white,
                  )
                : null,
          ),
        ),
      );
}
