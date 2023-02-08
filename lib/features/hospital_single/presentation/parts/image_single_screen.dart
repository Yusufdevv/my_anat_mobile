import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageSingleScreen extends StatefulWidget {
  final List<ImageEntity> images;
  final int index;

  const ImageSingleScreen({required this.images, this.index = 0, Key? key})
      : super(key: key);

  @override
  State<ImageSingleScreen> createState() => _ImageSingleScreenState();
}

class _ImageSingleScreenState extends State<ImageSingleScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        elevation: 0,
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: SvgPicture.asset(AppIcons.chevronLeft)),
          ),
        ),
      ),
      backgroundColor: dark,
      extendBodyBehindAppBar: true,
      body: Center(
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          // controller: pageController,
          itemCount: widget.images.length,
          builder: (context, index) => PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(
              widget.images[index].middle,
            ),
            gestureDetectorBehavior: HitTestBehavior.opaque,
          ),
          loadingBuilder: (_, __) => const CupertinoActivityIndicator(),
          pageController: pageController,
        ),
      ),
    );
  }
}
