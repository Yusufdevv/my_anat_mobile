import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String? url;

  const ProfileImage({this.url, this.width = 92, this.height = 92, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: height ?? 92,
      width: width ?? 92,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: primary),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height == 92 ? 41 : 24),
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => Padding(
            padding: const EdgeInsets.all(6),
            child: SvgPicture.asset(AppIcons.defaultImg),
          ),
          imageUrl: url ?? '',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
