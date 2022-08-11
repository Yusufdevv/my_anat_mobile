import 'package:anatomica/assets/colors/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double? radius;
  final bool hasBorder;
  final bool hasShadow;

  const ImageCard(
      {this.width,
      this.height,
      this.hasBorder = false,
      this.radius,
      this.hasShadow = false,
      required this.imageUrl,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 44,
      width: width ?? 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 8),
        border: Border.all(width: 1, color: aqua),
        boxShadow: [
          hasShadow
              ? BoxShadow(
                  color: chipShadowColor.withOpacity(0.12),
                  offset: const Offset(0, 4),
                  blurRadius: 10,
                )
              : const BoxShadow(),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
