import 'dart:developer';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/journal/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';

class PaymentWaiting extends StatelessWidget {
  final PaymentBloc paymentBloc;
  final bool isRegistered;
  final bool isSubscription;
  final String title;

  const PaymentWaiting(
      {required this.isRegistered,
      required this.title,
      this.isSubscription = false,
      Key? key,
      required this.paymentBloc})
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SvgPicture.asset(AppIcons.expect),
          SizedBox(
              height: 220,
              width: 220,
              child: Lottie.asset('assets/lotties/waiting_lottie.json',
                  fit: BoxFit.cover)),
          Text(
            LocaleKeys.payment_pending.tr(),
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 4,
            width: double.maxFinite,
          ),
          Text(
            LocaleKeys.payment_pending_subtitle.tr(),
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<PaymentBloc, PaymentState>(
        bloc: paymentBloc,
        builder: (context, state) {
          return WButton(
            isLoading: state.checkPaymentStatus.isSubmissionInProgress,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 16,
                left: 16,
                right: 16),
            onTap: () {
              paymentBloc.add(CheckPaymentStatus());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppIcons.refresh,
                  color: white,
                ),
                const SizedBox(width: 8),
                Text(LocaleKeys.update_page.tr())
              ],
            ),
          );
        },
      ),
    );
  }
}
