import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class WDivider extends StatelessWidget {
  final EdgeInsets margin;

  const WDivider({this.margin = EdgeInsets.zero, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 1,
      color: lilyWhite,
    );
  }
}
