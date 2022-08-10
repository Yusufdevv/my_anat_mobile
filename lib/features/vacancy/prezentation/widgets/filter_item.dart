import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: primary,
      ),
      child: Row(
        children: [
          Text(
            'До 3 000 000',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(width: 8),
          WScaleAnimation(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: white.withOpacity(0.04),
              ),
            ),
          )
        ],
      ),
    );
  }
}
