import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterItem extends StatelessWidget {
  final String icon;
  final bool isLast;

  const RegisterItem({required this.icon, this.isLast = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: white.withOpacity(0.4)),
            color: white,
          ),
          child: Center(
            child: SvgPicture.asset(icon, color: primary),
          ),
        ),
        !isLast
            ? Container(
                height: 1,
                width: 32,
                color: white,
              )
            : SizedBox(),
      ],
    );
  }
}
