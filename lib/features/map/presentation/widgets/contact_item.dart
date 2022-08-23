import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactItem extends StatelessWidget {
  final String icon;
  final String content;
  final bool isLast;

  const ContactItem({
    this.content = '+998 71 200-70-07',
    this.icon = AppIcons.boldPhone,
    this.isLast = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                height: 24,
                color: primary,
              ),
              const SizedBox(width: 8),
              Text(
                content,
                style: Theme.of(context).textTheme.headline1,
              )
            ],
          ),
        ),
        if (!isLast) ...{
          const Divider(
            height: 0,
            thickness: 1,
            color: textFieldColor,
            indent: 16,
          )
        },
      ],
    );
  }
}
