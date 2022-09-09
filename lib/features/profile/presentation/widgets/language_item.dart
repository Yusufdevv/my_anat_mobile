import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/profile/presentation/widgets/language_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageItem extends StatelessWidget {
  final Language language;
  final VoidCallback onTap;
  final int status;

  const LanguageItem({this.status = 0, required this.onTap, required this.language, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 44,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          children: [
            SvgPicture.asset(language.icon, height: 24, width: 24),
            const SizedBox(width: 8),
            Text(
              language.title,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const Spacer(),
            status == language.status ? SvgPicture.asset(AppIcons.check) : const SizedBox()
          ],
        ),
      ),
    );
  }
}
