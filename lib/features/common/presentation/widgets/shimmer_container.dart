import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const ShimmerContainer({
    required this.width,
    required this.height,
    this.radius = 4,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: const LinearGradient(colors: [white, lilyWhite]),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: darkerGreen, borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
