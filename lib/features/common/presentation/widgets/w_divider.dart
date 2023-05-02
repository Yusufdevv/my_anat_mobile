import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class WDivider extends StatelessWidget {
  final EdgeInsets margin;
  final Color? color;
  const WDivider({this.margin = EdgeInsets.zero, this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 1,
      color: color ?? lilyWhite,
    );
  }
}
