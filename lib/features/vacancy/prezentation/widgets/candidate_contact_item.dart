import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CandidateContactItem extends StatelessWidget {
  final String icon;

  const CandidateContactItem({this.icon = '', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 8),
            Text(
              '7SSP@anatomica.uz',
              style: Theme.of(context).textTheme.headline1,
            )
          ],
        ),
        const SizedBox(height: 16),
        const WDivider(),
      ],
    );
  }
}
