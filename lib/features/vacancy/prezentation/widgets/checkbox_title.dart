import 'package:anatomica/features/common/presentation/widgets/w_check_box.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:flutter/material.dart';

class CheckBoxTitle extends StatelessWidget {
  final String title;

  const CheckBoxTitle({this.title = '', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            WCheckBox(isChecked: true),
            const SizedBox(width: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.headline1!.copyWith(),
            )
          ],
        ),
        const SizedBox(height: 16),
        const WDivider()
      ],
    );
  }
}
