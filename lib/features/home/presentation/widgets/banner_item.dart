import 'dart:ui';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/home/presentation/blocs/home_articles_bloc/home_articles_bloc.dart';
import 'package:anatomica/features/home/presentation/parts/banner_single_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerItem extends StatefulWidget {
  final bool isShrink;
  final List<String> images;
  final List<String> titles;
  final List<String> subtitles;
  final List<String> types;
  final List<int> ids;

  const BannerItem(
      {required this.isShrink,
      required this.images,
      required this.subtitles,
      required this.titles,
      required this.types,
      required this.ids,
      Key? key})
      : super(key: key);

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem> {
  late PageController _pageController1;
  late PageController _pageController2;
  late ValueNotifier<PageController> _pageNotifier;
  int pageIndex = 0;

  @override
  void initState() {
    _pageController1 = PageController();
    _pageController2 = PageController();
    _pageNotifier = ValueNotifier(_pageController1);
    super.initState();
  }

  @override
  void dispose() {
    _pageController1.dispose();
    _pageController2.dispose();
    _pageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 500),
      crossFadeState: widget.isShrink
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      secondChild: Container(
        color: white,
        height: MediaQuery.of(context).size.height,
      ),
      firstChild: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: PageView.builder(
              controller: _pageController1,
              itemCount: widget.images.length,
              onPageChanged: (value) {
                _pageNotifier.value = _pageController1;
                // _pageController1.page;
                setState(() {
                  pageIndex = value;
                });
                _pageController1.animateToPage(
                  pageIndex,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.linear,
                );
                _pageController2.animateToPage(
                  pageIndex,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.linear,
                );
              },
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: widget.images[index],
                  progressIndicatorBuilder: (context, url, progress) {
                    print(
                        'progress => ${progress.downloaded / (progress.totalSize ?? 1)}');
                    if (progress.downloaded / (progress.totalSize ?? 1) == 1) {
                      context.read<HomeArticlesBloc>().add(
                          const HomeArticlesEvent.downloadBannerImage(
                              isDownloaded: true));
                    } else if (progress.downloaded / (progress.totalSize ?? 1) >
                            0 &&
                        progress.downloaded / (progress.totalSize ?? 1) < 1) {
                      context.read<HomeArticlesBloc>().add(
                          const HomeArticlesEvent.downloadBannerImage(
                              isDownloaded: false));
                    }
                    return Image.asset(
                      AppImages.placeHolderMainAppBar,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height,
                    );
                  },
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            textColor.withOpacity(0.9),
                            textColor.withOpacity(0.2),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(16),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  fade(
                    page: BannerSingleScreen(
                      image: widget.images[pageIndex],
                      id: widget.ids[pageIndex],
                    ),
                  ),
                );
              },
              behavior: HitTestBehavior.opaque,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    height: 106,
                    decoration: BoxDecoration(
                      color: textColor.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: PageView.builder(
                              itemCount: widget.images.length,
                              onPageChanged: (value) {
                                _pageNotifier.value = _pageController2;
                                // _pageController2.animateToPage(
                                //   pageIndex,
                                //   duration: const Duration(milliseconds: 250),
                                //   curve: Curves.linear,
                                // );
                                print(
                                    'page => ${_pageController2.page!.round()}');
                                setState(() {
                                  pageIndex = value;
                                });
                                _pageController1.animateToPage(
                                  pageIndex,
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.linear,
                                );
                                _pageController2.animateToPage(
                                  pageIndex,
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.linear,
                                );
                              },
                              controller: _pageController2,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.types[pageIndex],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(color: primary),
                                    ),
                                    // const SizedBox(height: 6),
                                    Expanded(
                                      child: Text(
                                        widget.titles[pageIndex],
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(color: white),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                        // const SizedBox(height: 12),
                        AnimatedBuilder(
                            animation: _pageNotifier,
                            builder: (context, child) {
                              return SmoothPageIndicator(
                                controller: _pageController1, // PageController
                                count: widget.images.length,
                                effect: const WormEffect(
                                  activeDotColor: white,
                                  dotHeight: 10,
                                  dotWidth: 10,
                                ), // your preferred effect
                                onDotClicked: (index) {},
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
