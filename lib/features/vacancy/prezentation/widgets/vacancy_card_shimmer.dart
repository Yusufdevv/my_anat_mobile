import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';

class VacancyCardShimmer extends StatelessWidget {
  const VacancyCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 223,
      height: 131,
      margin: const EdgeInsets.only(left: 12),
      padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
      decoration: BoxDecoration(
        color: lilyWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: pattensBlue),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ShimmerContainer(width: 100, height: 20),
          SizedBox(height: 8),
          ShimmerContainer(width: 120, height: 20),
          SizedBox(height: 20),
          ShimmerContainer(width: 100, height: 20),
          SizedBox(height: 8),
          ShimmerContainer(width: 120, height: 20),
        ],
      ),
    );
  }
}
