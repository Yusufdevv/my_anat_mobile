import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/journal/presentation/pages/journal_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class PaymentFailure extends StatelessWidget {
  final bool isSubscription;
  final bool isRegistered;
  final String title;

  const PaymentFailure(
      {required this.isSubscription,
      required this.isRegistered,
      required this.title,
      Key? key})
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
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: textColor, fontSize: 20),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset(AppIcons.failure),
            SizedBox(
                height: 180,
                width: 180,
                child: Lottie.asset('assets/lotties/error_lottie.json')),
            Text(
              LocaleKeys.payment_failure.tr(),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4, width: double.maxFinite),
            Text(
              LocaleKeys.payment_failure_subtitle.tr(),
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 16,
              left: 16,
              right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              WButton(
                borderRadius: 6,
                border: Border.all(color: primary),
                color: unFollowButton,
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    fade(page: const MagazineScreen()),
                    (route) => route.isFirst,
                  );
                },
                child: Text(
                  LocaleKeys.to_main.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 14),
                ),
              ),
              const SizedBox(height: 12),
              WButton(
                borderRadius: 6,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  LocaleKeys.to_retry.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ));
  }
}
