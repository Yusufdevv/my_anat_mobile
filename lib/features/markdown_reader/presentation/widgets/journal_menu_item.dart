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
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
