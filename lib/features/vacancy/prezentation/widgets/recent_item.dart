import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class RecentItem extends StatelessWidget {
  const RecentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(AppIcons.clock),
            const SizedBox(width: 12),
            Text(LocaleKeys.therapist.tr()),
            const Spacer(),
            SvgPicture.asset(AppIcons.x),
          ],
        ),
        const SizedBox(height: 12),
        const WDivider(),
      ],
    );
  }
}
