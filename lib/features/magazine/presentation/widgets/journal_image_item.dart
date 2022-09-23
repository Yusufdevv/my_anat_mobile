import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:flutter/material.dart';

class JournalImageItem extends StatelessWidget {
  final double height;
  final double width;
  const JournalImageItem({
    Key? key,
    required this.image,
    this.height = 120,
    this.width = 88,
  }) : super(key: key);

  final ImageEntity image;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: divider),
        boxShadow: [
          BoxShadow(
            color: journalShadow.withOpacity(0.16),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: WImage(
        imageUrl: image.middle,
        height: height,
        width: width,
        fit: BoxFit.cover,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
