import 'package:anatomica/features/common/presentation/widgets/custom_delay_tween.dart';
import 'package:flutter/material.dart';

class FourDotLoadingIndicator extends StatefulWidget {
  const FourDotLoadingIndicator({Key? key}) : super(key: key);

  @override
  State<FourDotLoadingIndicator> createState() => _FourDotLoadingIndicatorState();
}

class _FourDotLoadingIndicatorState extends State<FourDotLoadingIndicator> with TickerProviderStateMixin {
  final List<double> scaleDelays = [0, -1, -0.8, -0.6];
  final List<double> positionDelays = [0, -0.8, -0.6, -0.4];
  late AnimationController _animationController;
  late Animation<Color?> colorAnimation;
  bool isFirst = true;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
              child: _ColoredCircle(index: index),
            ),
          ),
        )
      ],
    );
  }
}

class _ColoredCircle extends StatefulWidget {
  final int index;
  const _ColoredCircle({required this.index, Key? key}) : super(key: key);

  @override
  State<_ColoredCircle> createState() => _ColoredCircleState();
}

class _ColoredCircleState extends State<_ColoredCircle> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
      ..repeat(min: 0, max: 1, reverse: true);

    colorAnimation = ColorTween(begin: const Color(0xffC4C4C4), end: const Color(0xff131414)).animate(CurvedAnimation(
        parent: controller,
        curve: Interval((0.15 * (widget.index)).toDouble(), 0.15 * (widget.index + 1), curve: Curves.bounceInOut)));
  }

  @override
  void dispose() {
    controller.stop();
    controller.dispose();

    super.dispose();
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
