import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingStars extends StatelessWidget {
  final double rate;
  final double starSize;
  final double starSpacing;
  final Color activeStarColor;
  final Color inactiveStarColor;
  final ValueChanged<double>? onChanged;
  const RatingStars({
    required this.rate,
    this.activeStarColor = primary,
    this.inactiveStarColor = textFieldColor,
    this.starSpacing = 4,
    this.starSize = 16,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          rate.toInt() <= 5 ? rate.toInt() : 5,
          (index) => Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (onChanged != null) {
                    onChanged!(index + 1);
                  }
                },
                child: SvgPicture.asset(
                  AppIcons.star,
                  height: starSize,
                  color: activeStarColor,
                ),
              ),
              SizedBox(width: starSpacing),
            ],
          ),
        ),
        ...List.generate(
          (5 - rate.toInt()) > 0 ? (5 - rate.toInt()) : 0,
          (index) => Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (onChanged != null) {
                    onChanged!(rate.toInt() + index + 1);
                  }
                },
                child: SvgPicture.asset(
                  AppIcons.star,
                  height: starSize,
                  color: inactiveStarColor,
                ),
              ),
              SizedBox(width: starSpacing),
            ],
          ),
        )
      ],
    );
  }
}
