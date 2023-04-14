import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/highlighted_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceItem extends StatelessWidget {
  final String title;
  final bool isLast;
  final String hightlightedText;
  final VoidCallback onTap;
  const ServiceItem({
    required this.title,
    this.isLast = false,
    required this.hightlightedText,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const SizedBox(
                  height: 6,
                  width: 6,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: primary, shape: BoxShape.circle),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: HighlightedText(
                    allText: title,
                    highlightedText: hightlightedText,
                    textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15),
                    textStyleHighlight: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                SvgPicture.asset(AppIcons.arrowRight, color: textSecondary)
              ],
            ),
          ),
        ),
        if (!isLast) ...{
          const Divider(
            height: 0,
            thickness: 1,
            color: textFieldColor,
          ),
        }
      ],
    );
  }
}
