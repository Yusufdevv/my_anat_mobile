import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image_preloader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final BorderRadius? borderRadius;
  final Widget? onErrorWidget;
  final Color? onErrorColor;
  final Widget? onLoading;

  const WImage({
    this.imageUrl = '',
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    this.color,
    this.borderRadius,
    this.onErrorWidget,
    this.onErrorColor = white,
    this.onLoading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          color: color,
          fit: fit,
          placeholder: (context, url) => const ImagePreloadShimmer(),
          errorWidget: (context, url, error) => Container(
            color: onErrorColor,
            child: onErrorWidget,
          ),
        ),
      );
}
