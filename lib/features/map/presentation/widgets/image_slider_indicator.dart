import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class ImageSliderIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const ImageSliderIndicator({required this.currentIndex, required this.itemCount, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          duration: const Duration(milliseconds: 150),
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: currentIndex == index ? primary : white.withOpacity(0.6),
          ),
          width: currentIndex == index ? 16 : 6,
        ),
      ),
    );
  }
}
