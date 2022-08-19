import 'package:anatomica/assets/colors/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String? url;

  const ProfileImage({this.url, this.width = 92, this.height = 92, Key? key}) : super(key: key);

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
          imageUrl:url?? 'https://media.istockphoto'
              '.com/photos/beautiful-woman-soft-makeup-and-perfect-skin-picture'
              '-id1133213198?b=1&k=20&m=1133213198&s=170667a&w=0&h'
              '=smjEB4eqKkS7jEr8v6BFw6WZvKVGrjtY4kcqoMVrXyM=',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
