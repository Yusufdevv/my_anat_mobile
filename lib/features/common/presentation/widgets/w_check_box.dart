import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WCheckBox extends StatelessWidget {
  bool isChecked;
  final Color checkBoxColor;
  final double size;

  WCheckBox({
    required this.isChecked,
    this.size = 20,
    this.checkBoxColor = primary,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: const Duration(milliseconds: 150),
    height: size,
    width: size,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: isChecked ? checkBoxColor : lilyWhite,
      borderRadius: BorderRadius.circular(4),
      border: Border.all(
          color: isChecked ? checkBoxColor : Colors.transparent, width: 2),
    ),
    child: Icon(
      CupertinoIcons.checkmark_alt,
      size: size - 4,
      color: isChecked ? white : Colors.transparent,
    ),
  );
}
