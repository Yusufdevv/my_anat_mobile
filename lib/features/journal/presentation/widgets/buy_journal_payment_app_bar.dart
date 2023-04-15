import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyJournalAppbarTitle extends StatelessWidget {
  const BuyJournalAppbarTitle({
    super.key,
    required this.isRegistered,
  });

  final bool isRegistered;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: WScaleAnimation(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
                    child: SvgPicture.asset(AppIcons.chevronLeft, color: textSecondary),
                  ),
                ),
              ),
            ),
            Text(
              isRegistered ? LocaleKeys.buy_magazine.tr() : LocaleKeys.only_pay.tr(),
              style: Theme.of(context).textTheme.displaySmall!.copyWith(color: textColor, fontSize: 20),
            ),
            const Spacer()
          ],
        ),
      ],
    );
  }
}
