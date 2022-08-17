import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  final Color color;
  final double radius;
  final double horizontalPadding;
  final double height;
  const CustomTabIndicator({required this.color, required this.radius, this.horizontalPadding = 42, this.height = 4})
      : super();
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return ClipPainter(color: color, radius: radius, horizontalPadding: horizontalPadding, height: height);
  }
}

class ClipPainter extends BoxPainter {
  final Paint _paint;
  final double horizontalPadding;
  final Color color;
  final double radius;
  final double height;

  ClipPainter({
    required this.radius,
    required this.color,
    required this.horizontalPadding,
    required this.height,
  })  : _paint = Paint()
          ..color = color
          ..isAntiAlias = true,
        super();

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final horizontalPadding = this.horizontalPadding;
    final height = this.height;
    Size size = Size(configuration.size!.width - (horizontalPadding * 2), height);

    Offset indicatorOffset = Offset(
      offset.dx + horizontalPadding,
      offset.dy + (configuration.size!.height - height),
    );
    final Rect rect = indicatorOffset & size;

    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)), _paint);
  }
}
