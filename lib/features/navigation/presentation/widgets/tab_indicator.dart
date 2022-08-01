import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CustomTabIndicator({required this.color, required this.radius}) : super();
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return ClipPainter(color: color, radius: radius);
  }
}

class ClipPainter extends BoxPainter {
  final Paint _paint;

  final Color color;
  final double radius;

  ClipPainter({
    required this.radius,
    required this.color,
  })  : _paint = Paint()
          ..color = color
          ..isAntiAlias = true,
        super();

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    const horizontalPadding = 42;
    const height = 4.0;
    Size size = Size(configuration.size!.width - (horizontalPadding * 2), height);

    Offset indicatorOffset = Offset(
      offset.dx + horizontalPadding,
      offset.dy + (configuration.size!.height - height),
    );
    final Rect rect = indicatorOffset & size;

    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)), _paint);
  }
}
