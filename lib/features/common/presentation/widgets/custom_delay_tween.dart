import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomDelayTween<T extends Object?> extends Tween<T> {
  CustomDelayTween({T? begin, T? end, required this.delay}) : super(begin: begin, end: end);
  final double delay;
  @override
  T lerp(double t) => super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  T evaluate(Animation<double> animation) => lerp(animation.value);
}
