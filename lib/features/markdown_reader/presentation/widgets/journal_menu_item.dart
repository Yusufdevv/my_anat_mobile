import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JournalMenuItem extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  const JournalMenuItem({
    required this.title,
    required this.onTap,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 36, 12),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 6),
            Text(
              title,
              style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
