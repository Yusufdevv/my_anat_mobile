import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapControllerButtons extends StatelessWidget {
  final VoidCallback onPlusTap;
  final VoidCallback onMinusTap;
  final VoidCallback onCurrentLocationTap;

  const MapControllerButtons({
    required this.onCurrentLocationTap,
    required this.onMinusTap,
    required this.onPlusTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 24,
                color: chipShadowColor.withOpacity(0.19),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              WScaleAnimation(
                onTap: onPlusTap,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(AppIcons.plusIcon),
                ),
              ),
              Container(
                height: 1,
                width: 28,
                color: textColor.withOpacity(0.1),
              ),
              WScaleAnimation(
                onTap: onMinusTap,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(AppIcons.minusIcon),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 12),
        WScaleAnimation(
          onTap: onCurrentLocationTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 24,
                  color: chipShadowColor.withOpacity(0.19),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(AppIcons.currentLocation),
          ),
        )
      ],
    );
  }
}
