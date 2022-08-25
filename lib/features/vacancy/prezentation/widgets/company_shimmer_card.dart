import 'package:anatomica/features/common/presentation/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';

class CompanyShimmerCard extends StatelessWidget {
  const CompanyShimmerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ShimmerContainer(width: 44, height: 44),
        const SizedBox(width: 12),
        Column(
          children: const [
            ShimmerContainer(height: 15, width: 100),
            SizedBox(height: 10),
            ShimmerContainer(height: 15, width: 100),
          ],
        ),
        const Spacer(),
        const ShimmerContainer(width: 16, height: 16),
        const SizedBox(width: 12)
      ],
    );
  }
}
