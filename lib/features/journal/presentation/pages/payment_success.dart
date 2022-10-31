import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/journal/presentation/pages/journal_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:clipboard/clipboard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentSuccess extends StatelessWidget {
  final bool isSubscription;
  final bool isRegistered;
  const PaymentSuccess({
    required this.isRegistered,
    required this.isSubscription,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int id = 123456;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        shadowColor: textFieldColor,
        titleSpacing: 0,
        leadingWidth: 56,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(16).copyWith(bottom: 12),
            child: SvgPicture.asset(
              AppIcons.chevronLeft,
              color: textSecondary,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          isSubscription
              ? LocaleKeys.subscription_title.tr()
              : isRegistered
                  ? LocaleKeys.buy_magazine.tr()
                  : LocaleKeys.only_pay.tr(),
          style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor, fontSize: 20),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.success),
          const SizedBox(height: 16),
          Text(
            LocaleKeys.success_purchase.tr(),
            style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            LocaleKeys.realization_success.tr(),
            style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: LocaleKeys.id_purchase.tr(),
                  style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                      text: id.toString(),
                      style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: SvgPicture.asset(AppIcons.copy),
                onPressed: () {
                  FlutterClipboard.copy(id.toString());
                },
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: WButton(
        text: LocaleKeys.to_main.tr(),
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom, left: 16, right: 16),
        onTap: () {
          Navigator.push(context, fade(page: const MagazineScreen()));
        },
      ),
    );
  }
}