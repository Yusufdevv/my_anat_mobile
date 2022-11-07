import 'package:anatomica/features/onboarding/domain/entities/splash_entity.dart';
import 'package:flutter/material.dart';

class ImageProduct extends StatelessWidget {
  final List<SlideEntity> products;
  final int index;

  const ImageProduct(this.products, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(0.0),
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          products[index].img,
        ),
      )),
    );
  }
}
