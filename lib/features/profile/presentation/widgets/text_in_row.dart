import 'package:anatomica/core/utils/my_functions.dart';
import 'package:flutter/material.dart';

class TextInRow extends StatelessWidget {
  final String title;
  final int amount;
  const TextInRow({required this.title, required this.amount, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title.isEmpty ? 'Empty' : title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(),
            ),
          ),
          const SizedBox(width: 20),
          Text(
            '${MyFunctions.getPriceFormat(amount)} UZS',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
