import 'package:flutter/material.dart';

class VacancyTitleText extends StatelessWidget {
  final String title;
  final double? fontSize;

  const VacancyTitleText({this.title = '', this.fontSize, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600, fontSize: fontSize ?? 16),
    );
  }
}
