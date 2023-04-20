import 'dart:ui';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/home/presentation/blocs/home_articles_bloc/home_articles_bloc.dart';
import 'package:anatomica/features/home/presentation/parts/banner_single_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerItem extends StatefulWidget {
  final bool isShrink;
  final List<String> images;
  final List<String> titles;
  final List<String> subtitles;
  final List<String> types;
  final List<int> ids;
  final HomeArticlesBloc bloc;

  const BannerItem(
      {required this.isShrink,
      required this.images,
      required this.subtitles,
      required this.titles,
      required this.types,
      required this.bloc,
      required this.ids,
      Key? key})
      : super(key: key);

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem> {
  late PageController _pageController;
  int pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
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
              controller: _pageController,
              itemCount: widget.images.length,
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value;
                });
              },
              itemBuilder: (context, index) {
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
                      image: NetworkImage(widget.images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                      bloc: widget.bloc,
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
                    // height: 106,
                    decoration: BoxDecoration(
                      color: textColor.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.types[pageIndex],
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: primary),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.titles[pageIndex],
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: white),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        SmoothPageIndicator(
                          controller: _pageController, // PageController
                          count: widget.images.length,
                          effect: const WormEffect(
                            activeDotColor: white,
                            dotHeight: 10,
                            dotWidth: 10,
                          ), // your preferred effect
                          onDotClicked: (index) {},
                        ),
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
