import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/shimmer_container.dart';
import 'package:flutter/cupertino.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: textFieldColor, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      height: 77,
      width: MediaQuery.of(context).size.width / 2.25,
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          ShimmerContainer(width: 24, height: 24),
          SizedBox(height: 6),
          ShimmerContainer(width: double.maxFinite, height: 15)
        ],
      ),
    );
    ;
  }
}
