import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String subTitle;

  const InfoItem({required this.title, required this.subTitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 4),
        Text(
          subTitle,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
