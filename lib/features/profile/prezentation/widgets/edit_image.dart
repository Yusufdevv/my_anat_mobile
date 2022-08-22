import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class EditImage extends StatelessWidget {
  const EditImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: primary,
      ),
    );
  }
}
