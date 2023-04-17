import 'package:flutter/material.dart';

class TextInRow extends StatelessWidget {
  final String title;
  final String amount;
  const TextInRow({required this.title, required this.amount, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title.isEmpty ? 'Empty' : title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(),
          ),
        ),
        Text(
          '20 000 UZS',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
