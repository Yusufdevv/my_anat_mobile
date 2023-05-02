import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingStars extends StatelessWidget {
  final double rate;
  final double starSize;
  final double starSpacing;
  final Color activeStarColor;
  final Color inactiveStarColor;
  final ValueChanged<double>? onChanged;
  final bool readOnly;
  final bool allowHalfRating;

  const RatingStars({
    required this.rate,
    this.activeStarColor = primary,
    this.inactiveStarColor = textFieldColor,
    this.starSpacing = 4,
    this.starSize = 16,
    this.onChanged,
    this.readOnly = true,
    this.allowHalfRating = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rate,
      unratedColor: inactiveStarColor,
      itemSize: starSize,
      direction: Axis.horizontal,
      allowHalfRating: allowHalfRating,
      itemCount: 5,
      itemPadding: EdgeInsets.only(right: starSpacing),
      itemBuilder: (context, _) => SvgPicture.asset(
        AppIcons.star,
        height: starSize,
        color: activeStarColor,
      ),
      glow: false,
      ignoreGestures: readOnly,
      onRatingUpdate: (rating) {
        onChanged!(rating);
      },
    );
  }
}
