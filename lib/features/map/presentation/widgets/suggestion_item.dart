import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuggestionItem extends StatelessWidget {
  final String title;
  final bool isLast;

  const SuggestionItem({
    required this.title,
    this.isLast = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              SvgPicture.asset(AppIcons.search),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
              ),
            ],
          ),
        ),
        if (!isLast) ...{
          const Divider(
            height: 0,
            thickness: 1,
            indent: 40,
            color: dividerColor,
          )
        }
      ],
    );
  }
}
