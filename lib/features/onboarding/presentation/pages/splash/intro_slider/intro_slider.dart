import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/navigation/presentation/home.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/onboarding/domain/entities/splash_entity.dart';
import 'package:anatomica/features/onboarding/presentation/pages/splash/dot_indicator.dart';
import 'package:anatomica/features/onboarding/presentation/pages/splash/intro_slider/scollbar_behavior_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom.dart';
import 'list_rtl_language.dart';

class IntroSlider extends StatefulWidget {
  final Color? backgroundColorAllSlides;
  final List<SlideEntity> product;
  final String? heroTag;
  final Widget? renderNextBtn;
  final String? nameNextBtn;
  final bool? isShowNextBtn;
  final String? nameDoneBtn;
  final Widget? renderDoneBtn;
  final double? widthDoneBtn;
  final Function? onDonePress;
  final TextStyle? styleNameDoneBtn;
  final Color? colorDoneBtn;
  final Color? highlightColorDoneBtn;
  final double? borderRadiusDoneBtn;
  final bool? isShowDoneBtn;
  final bool? isShowDotIndicator;
  final Color? colorDot;
  final Color? colorActiveDot;
  final double? sizeDot;
  final Size? size;
  final ScrollbarBehavior? verticalScrollbarBehavior;

  const IntroSlider({
    super.key,
    required this.product,
    this.backgroundColorAllSlides,
    this.size,
    this.renderDoneBtn,
    this.widthDoneBtn,
    this.onDonePress,
    this.nameDoneBtn,
    this.colorDoneBtn,
    this.highlightColorDoneBtn,
    this.borderRadiusDoneBtn,
    this.styleNameDoneBtn,
    this.isShowDoneBtn,
    this.renderNextBtn,
    this.nameNextBtn,
    this.isShowNextBtn,
    this.isShowDotIndicator,
    this.colorDot,
    this.colorActiveDot,
    this.sizeDot,
    this.verticalScrollbarBehavior,
    this.heroTag,
  });

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider>
    with SingleTickerProviderStateMixin {
  bool isShowDotIndicator = true;
  double sizeDot = 8.0;
  late PageController _pageController;
  List<Widget> tabs = [];
  List<Widget> dots = [];
  List<double> sizeDots = [];
  List<double> opacityDots = [];
  List<ScrollController> scrollControllers = [];
  double marginLeftDotFocused = 0;
  double marginRightDotFocused = 0;
  double currentAnimationValue = 0;
  int currentTabIndex = 0;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      keepPage: false,
      viewportFraction: 0.55,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  bool isRTLLanguage(language) {
    return rtlLanguages.contains(language);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [primary, white],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              color: white.withOpacity(0.6),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      child: ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: PageView.builder(
                          itemCount: widget.product.length,
                          onPageChanged: (value) {
                            setState(() {
                              _currentPage = value;
                            });
                          },
                          physics: const BouncingScrollPhysics(),
                          controller: _pageController,
                          itemBuilder: (context, index) =>
                              CustomBuilderAnimation(
                            index: index,
                            products: widget.product,
                            pageController: _pageController,
                            currentPage: _currentPage,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 24,
            right: 24,
            child: SafeArea(
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.anatomica,
                  height: 38,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 16,
            left: 24.0,
            right: 24.0,
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: _currentPage == 3
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.diamond,
                              color: primary,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Premium',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(fontSize: 20),
                            )
                          ],
                        )
                      : Text(
                          widget.product[_currentPage].label,
                          key: UniqueKey(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontSize: 20, color: textColor),
                        ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.product[_currentPage].subLabel,
                  key: UniqueKey(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontSize: 14, color: textColor),
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Flexible(
                        child: Stack(
                      alignment: Alignment.centerRight,
                      children: <Widget>[
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: _currentPage > 0
                                ? GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      _pageController.previousPage(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.easeIn);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color:
                                              unFollowButton.withOpacity(0.1),
                                          shape: BoxShape.circle),
                                      child: SvgPicture.asset(
                                        AppIcons.arrowLeft,
                                        color: primary,
                                        height: 24,
                                        width: 24,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                        ),
                        WScaleAnimation(
                          onTap: () async {
                            if (_currentPage < 3) {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.linear);
                            } else {
                              await StorageRepository.putBool(
                                  key: 'onboarding', value: true);
                              Navigator.of(context).pushReplacement(
                                  fade(page: const HomeScreen()));
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: widget.widthDoneBtn ??
                                MediaQuery.of(context).size.width / 4,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primary,
                            ),
                            child: SvgPicture.asset(
                              AppIcons.rightArrow,
                              height: 24,
                              color: white,
                            ),
                          ),
                        ),
                        DotsIndicator(
                          currentPage: _currentPage,
                          itemCount: widget.product.length,
                          color: widget.colorDot ?? Colors.transparent,
                          dotSize: sizeDot,
                          onPageSelected: (index) => jumpToPage(index),
                          dotSpacing: 15,
                          dotIncreaseSize: 1.5,
                        ),
                      ],
                    )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: widget.backgroundColorAllSlides ?? Colors.transparent,
    );
  }

  Widget buildDoneButton() {
    return GestureDetector(
        onTap: () => widget.onDonePress, child: widget.renderDoneBtn);
  }

  Widget buildNextButton() {
    return GestureDetector(
      onTap: () {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
      },
      child: widget.renderNextBtn,
    );
  }

  void jumpToPage(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
