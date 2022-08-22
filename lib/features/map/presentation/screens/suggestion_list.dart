import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/map/presentation/widgets/suggestion_item.dart';
import 'package:flutter/material.dart';

class SuggestionListScreen extends StatelessWidget {
  const SuggestionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          color: textFieldColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(4, (index) => SuggestionItem(title: 'Suggestion $index')),
        ),
      ),
    );
  }
}
