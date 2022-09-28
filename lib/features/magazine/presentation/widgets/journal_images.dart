import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/magazine/presentation/widgets/journal_image_item.dart';
import 'package:flutter/material.dart';

class JournalImages extends StatelessWidget {
  final List<ImageEntity> images;
  const JournalImages({
    required this.images,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const SizedBox.shrink();
    }
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: images.length >= 3
            ? [
                Positioned(
                  left: -48,
                  child: JournalImageItem(image: images.first),
                ),
                Positioned(
                  right: -48,
                  child: JournalImageItem(image: images[1]),
                ),
                JournalImageItem(
                  image: images[2],
                  height: 160,
                  width: 116,
                ),
              ]
            : [
                JournalImageItem(
                  image: images.first,
                  height: 160,
                  width: 116,
                ),
              ],
      ),
    );
  }
}
