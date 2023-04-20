import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/highlighted_text.dart';
import 'package:flutter/material.dart';

class SpecilaizationItem extends StatelessWidget {
  const SpecilaizationItem({
    required this.allText,
    required this.highlightedText,
    required this.fenceColor,
    super.key,
  });

  final String allText;
  final String highlightedText;
  final Color fenceColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: lilyWhite,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: lilyWhite),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('#', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: fenceColor)),
          const SizedBox(width: 4),
          HighlightedText(
            allText: allText,
            highlightColor: tacao,
            highlightedText: highlightedText,
            textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: textColor),
            textStyleHighlight: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: textColor),
          ),
        ],
      ),
    );
  }
}
