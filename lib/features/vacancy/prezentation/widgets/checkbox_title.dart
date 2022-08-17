import 'package:anatomica/features/common/presentation/widgets/w_check_box.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:flutter/material.dart';

class CheckBoxTitle extends StatelessWidget {
  final String title;
  final bool isLast;
  final bool isChecked;
  final VoidCallback onTap;
  final EdgeInsets? padding;

  const CheckBoxTitle({
    required this.onTap,
    this.title = '',
    this.isChecked = false,
    this.padding,
    this.isLast = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:padding?? const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                WCheckBox(isChecked: isChecked),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline1!.copyWith(),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          !isLast ? const WDivider() : const SizedBox(),
          SizedBox(height: isLast ? 8 : 16),
        ],
      ),
    );
  }
}
