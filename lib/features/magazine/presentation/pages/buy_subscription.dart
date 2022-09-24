import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:flutter/material.dart';

class BuySubscription extends StatelessWidget {
  final List<ImageEntity> images;

  const BuySubscription({required this.images, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
