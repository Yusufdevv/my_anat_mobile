import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/journal/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:anatomica/features/journal/presentation/pages/journal_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:clipboard/clipboard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccess extends StatelessWidget {
  final bool isSubscription;
  final bool isRegistered;
  final String title;

  const PaymentSuccess({
    required this.isRegistered,
    required this.isSubscription,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 180,
                  width: 180,
                  child: Lottie.asset('assets/lotties/success_lottie.json',
                      repeat: true)),
              const SizedBox(height: 16, width: double.maxFinite),
              Text(
                LocaleKeys.payment_success.tr(),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                LocaleKeys.payment_success.tr(),
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          bottomNavigationBar: WButton(
            text: LocaleKeys.to_main.tr(),
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 16,
                left: 16,
                right: 16),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                fade(page: const MagazineScreen()),
                (route) => route.isFirst,
              );
            },
          ),
        );
      },
    );
  }
}
