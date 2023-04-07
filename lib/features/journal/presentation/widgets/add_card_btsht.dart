import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/default_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/journal/presentation/pages/add_payment_card_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCardBtsht extends StatefulWidget {
  const AddCardBtsht({Key? key}) : super(key: key);

  @override
  State<AddCardBtsht> createState() => _AddCardBtshtState();
}

class _AddCardBtshtState extends State<AddCardBtsht> {
  late TextEditingController cardController;
  late TextEditingController dateController;

  @override
  void initState() {
    cardController = TextEditingController();
    dateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    cardController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WBottomSheet(
      hasBackButton: false,
      contentPadding: EdgeInsets.only(
          left: 16, top: 14, bottom: 4 + MediaQuery.of(context).padding.bottom),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(AppIcons.leftArrow),
                const SizedBox(width: 8),
                Text(
                  LocaleKeys.add_card.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const WDivider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 16, 0),
              child: DefaultTextField(
                title: LocaleKeys.number_card.tr(),
                controller: cardController,
                hasError: false,
                onChanged: (value) {},
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: SvgPicture.asset(AppIcons.creditCard),
                ),
                hintText: LocaleKeys.enter_card_number.tr(),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: DefaultTextField(
                title: LocaleKeys.card_term.tr(),
                controller: dateController,
                hasError: false,
                onChanged: (value) {},
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: SvgPicture.asset(AppIcons.clock),
                ),
                hintText: LocaleKeys.enter_card_term.tr(),
              ),
            ),
            const SizedBox(height: 24),
            WButton(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, fade(page: const AddPaymentCardVerifyScreen()));
              },
              height: 40,
              margin: EdgeInsets.only(
                bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
                right: 16,
              ),
              text: LocaleKeys.apply.tr(),
            )
          ],
        ),
      ],
    );
  }
}
