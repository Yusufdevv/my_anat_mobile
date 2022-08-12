import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final bool isLast;

  const SearchItem({this.isLast = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Терапевт',
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(height: 13),
        !isLast ? const WDivider(margin: EdgeInsets.only(bottom: 13)) : const SizedBox()
      ],
    );
  }
}
