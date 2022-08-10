import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VacancyItemTextWidget extends StatelessWidget {
  final String icon;
  final String title;

  const VacancyItemTextWidget({required this.title, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        const SizedBox(width: 4),
        Text(
          title,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
        )
      ],
    );
  }
}
