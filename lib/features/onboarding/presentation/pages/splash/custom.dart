import 'dart:ui';

import 'package:anatomica/core/utils/interpolate.dart';
import 'package:anatomica/features/onboarding/domain/entities/splash_entity.dart';
import 'package:flutter/material.dart';

class CustomBuilderAnimation extends StatefulWidget {
  final int index;
  final List<SlideEntity> products;
  final PageController pageController;
  final int currentpage;

  const CustomBuilderAnimation(
      {required this.index, required this.products, required this.currentpage, required this.pageController, Key? key})
      : super(key: key);

  @override
  State<CustomBuilderAnimation> createState() => _CustomBuilderAnimationState();
}

class _CustomBuilderAnimationState extends State<CustomBuilderAnimation> {
  final Interpolate interpolate = Interpolate(
    inputRange: [0, .4],
    outputRange: [
      0.1,
      0.0,
    ],
    extrapolate: Extrapolate.clamp,
  );

  final Interpolate interpolate2 = Interpolate(
    inputRange: [1, 1.9],
    outputRange: [
      0,
      -0.1,
    ],
    extrapolate: Extrapolate.clamp,
  );

  final Interpolate interpolate3 = Interpolate(
    inputRange: [1, 1.9],
    outputRange: [
      0.1,
      0,
    ],
    extrapolate: Extrapolate.clamp,
  );

  @override
  Widget build(BuildContext context) {
    double _width = 0;
    return AnimatedBuilder(
      animation: widget.pageController,
      child: ImageProduct(products: widget.products, index: widget.index),
      builder: (context, child) {
        return _buildInfoProduct(context, child ?? const SizedBox(), widget.index, _width);
      },
    );
  }

  Widget _buildInfoProduct(BuildContext context, Widget child, int index, double _width) {
    double value = 1.0;
    double rotated = 0.0;
    if (widget.pageController.position.haveDimensions) {
      value = widget.pageController.page! - index;
      rotated = widget.pageController.page!;
      value = (1 - (value.abs() * 0.2)).clamp(0.0, 1.0);
    } else {
      if (index > 0) value = (1 - (value.abs() * 0.2)).clamp(0.0, 1.0);
    }

    double mainSize = MediaQuery.of(context).size.height > 700 ? 320 : 230;
    double secondSize = MediaQuery.of(context).size.height > 700 ? 320 : 230;
    index == widget.currentpage ? _width = mainSize : _width = secondSize;
    // ignore: missing_return
    double? rotate(value) {
      switch (index) {
        case 0:
          return lerpDouble(0, -0.1, rotated);
          break;
        case 1:
          if (rotated < .5) {
            return interpolate.eval(rotated);
          } else {
            return interpolate2.eval(rotated);
          }
          break;

        case 2:
          return interpolate3.eval(rotated);
          break;

        default:
          return null;
      }
      // if (value > 0.5) {
      //   if (currentpage > index) {
      //     return lerpDouble(-0.3, 0, value);
      //   } else {
      //     return lerpDouble(0.3, 0, value);
      //   }
      // } else {
      //   if (currentpage < index) {
      //     return lerpDouble(-0.3, 0, value);
      //   } else {
      //     return lerpDouble(0.3, 0, value);
      //   }
      // }
    }

    return Center(
      child: Container(
        alignment: Alignment(0, MediaQuery.of(context).size.height < 700 ? 0.45 : 0.35),
        child: Transform.rotate(
          angle: rotate(value) ?? 0,
          child: SizedBox(
            //duration: Duration(milliseconds: 5),
            height: Curves.linear.transform(value) * _width * 1.5,
            child: index == widget.currentpage
                ? Column(
                    children: <Widget>[
                      Expanded(child: child),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Container(
                      child: child,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class ImageProduct extends StatelessWidget {
  final List<SlideEntity> products;
  final int index;

  const ImageProduct({
    super.key,
    required this.index,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
