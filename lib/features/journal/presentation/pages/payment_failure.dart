import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/journal/presentation/pages/journal_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentFailure extends StatelessWidget {
  final bool isSubscription;
  final bool isRegistered;
  final String title;
  const PaymentFailure({required this.isSubscription, required this.isRegistered, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.failure),
              const SizedBox(height: 16),
              Text(
                LocaleKeys.error.tr(),
                style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                LocaleKeys.realisation_error.tr(args: [title]),
                style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom, left: 16, right: 16),
          child: Row(
            children: [
              Expanded(
                child: WButton(
                  borderRadius: 6,
                  border: Border.all(color: primary),
                  color: unFollowButton,
                  margin: const EdgeInsets.only(top: 12),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      fade(page: const MagazineScreen()),
                      (route) => route.isFirst,
                    );
                  },
                  child: Text(
                    LocaleKeys.to_main.tr(),
                    style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: WButton(
                  margin: const EdgeInsets.only(top: 12),
                  borderRadius: 6,
                  onTap: () {},
                  child: Text(
                    LocaleKeys.to_retry.tr(),
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
