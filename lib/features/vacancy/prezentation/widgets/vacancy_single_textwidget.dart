import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VacancySingleTextWidget extends StatelessWidget {
  final String icon;
  final String title;

  const VacancySingleTextWidget({required this.title, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 18,
            width: 18,
            child: SvgPicture.asset(icon, color: textSecondary, fit: BoxFit.cover)),
        const SizedBox(width: 12),
        Expanded(
          child:
              Text(title, style: Theme.of(context).textTheme.bodyText1!.copyWith(color: montana)),
        ),
      ],
    );
  }
}
