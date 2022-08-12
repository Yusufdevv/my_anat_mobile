import 'dart:math' as math show sin, pi;

import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          SvgPicture.asset(AppIcons.anatomica),
          const Spacer(),
          FourDotLoadingIndicator(),
          SizedBox(
            height: 20 + mediaQuery.padding.bottom,
          )
        ],
      ),
    );
  }
}

class FourDotLoadingIndicator extends StatefulWidget {
  const FourDotLoadingIndicator({Key? key}) : super(key: key);

  @override
  State<FourDotLoadingIndicator> createState() => _FourDotLoadingIndicatorState();
}

class _FourDotLoadingIndicatorState extends State<FourDotLoadingIndicator> with TickerProviderStateMixin {
  final List<double> scaleDelays = [0, -1, -0.8, -0.6];
  final List<double> positionDelays = [0, -0.8, -0.6, -0.4];
  late AnimationController _animationController;
  late AnimationController _colorAnimationController;
  late Animation<Color?> colorAnimation;
  bool isFirst = true;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))..repeat();
    _colorAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))
      ..repeat(reverse: true);
    colorAnimation =
        ColorTween(begin: const Color(0xffC4C4C4), end: const Color(0xff131414)).animate(_colorAnimationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          scaleDelays.length,
          (index) => ScaleTransition(
            scale:
                CustomDelayTween<double>(begin: 0.67, end: 1, delay: scaleDelays[index]).animate(_animationController),
            child: SlideTransition(
              position: CustomDelayTween<Offset>(
                      begin: const Offset(0, 0), end: const Offset(0, 0.3), delay: positionDelays[index])
                  .animate(_animationController),
              child: AnimatedBuilder(
                animation: colorAnimation,
                builder: (context, child) {
                  return ColoredCircle(index: index);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ColoredCircle extends StatefulWidget {
  final int index;
  const ColoredCircle({required this.index, Key? key}) : super(key: key);

  @override
  State<ColoredCircle> createState() => _ColoredCircleState();
}

class _ColoredCircleState extends State<ColoredCircle> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
      ..repeat(min: 0, max: 1, reverse: true);

    // controller.forward();
    colorAnimation = ColorTween(begin: const Color(0xffC4C4C4), end: const Color(0xff131414)).animate(CurvedAnimation(
        parent: controller,
        curve: Interval((0.15 * (widget.index)).toDouble(), 0.15 * (widget.index + 1), curve: Curves.bounceInOut)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: colorAnimation,
      builder: (context, child) => Container(
        height: 10,
        width: 10,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(shape: BoxShape.circle, color: colorAnimation.value),
      ),
    );
  }
}

class CustomDelayTween<T extends Object?> extends Tween<T> {
  CustomDelayTween({T? begin, T? end, required this.delay}) : super(begin: begin, end: end);
  final double delay;
  @override
  T lerp(double t) => super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  T evaluate(Animation<double> animation) => lerp(animation.value);
}
