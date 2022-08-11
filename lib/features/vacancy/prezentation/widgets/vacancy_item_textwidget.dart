import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VacancyItemTextWidget extends StatelessWidget {
  final String icon;
  final String title;
  final TextStyle? textStyle;
  final double? height;
  final double? width;

  const VacancyItemTextWidget(
      {required this.title, required this.icon, this.textStyle, this.height, this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: height ?? 16, width: width ?? 16),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            title,
            style: textStyle ??
                Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
          ),
        )
      ],
    );
  }
}
