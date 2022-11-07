import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    required this.currentPage,
    required this.itemCount,
    required this.onPageSelected,
    required this.color,
    required this.dotSize,
    required this.dotIncreaseSize,
    required this.dotSpacing,
    Key? key,
  }) : super(key: key);

  final int currentPage;
  final int itemCount;
  final ValueChanged<int> onPageSelected;
  final Color color;
  final double dotSize;
  final double dotIncreaseSize;
  final double dotSpacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => GestureDetector(
          onTap: () => onPageSelected(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 8,
            width: 8,
            margin: EdgeInsets.only(right: index == 3 ? 0 : 6),
            decoration:
                BoxDecoration(color: index == currentPage ? primary : primary.withOpacity(0.3), shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}
