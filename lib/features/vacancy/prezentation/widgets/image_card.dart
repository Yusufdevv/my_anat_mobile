import 'package:anatomica/assets/colors/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;

  const ImageCard({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: aqua),
      ),
      child: CachedNetworkImage(imageUrl: imageUrl),
    );
  }
}
