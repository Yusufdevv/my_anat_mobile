import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_cupertino_switch.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AutoPaymentPage extends StatefulWidget {
  const AutoPaymentPage({super.key});

  @override
  State<AutoPaymentPage> createState() => _AutoPaymentPageState();
}

class _AutoPaymentPageState extends State<AutoPaymentPage> {
  bool enableJournalAutoPay = false;

  bool enableDoctorlAutoPay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(
        title: LocaleKeys.auto_payment.tr(),
        hasUnderline: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.doctor_organization.tr(),
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color: dark),
                  ),
                  WCupertinoSwitch(
                    onChange: (val) {
                      enableDoctorlAutoPay = val;
                      setState(() {});
                    },
                    isSwitched: enableDoctorlAutoPay,
                    inactiveColor: textSecondary,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.journal_article.tr(),
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color: dark),
                  ),
                  WCupertinoSwitch(
                    onChange: (val) {
                      enableJournalAutoPay = val;
                      setState(() {});
                    },
                    isSwitched: enableDoctorlAutoPay,
                    inactiveColor: textSecondary,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
