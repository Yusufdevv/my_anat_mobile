import 'dart:developer';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/auth/presentation/widgets/pin_code_body.dart';
import 'package:anatomica/features/common/presentation/bloc/payment_card/payment_cards_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/profile/domain/usecases/confirm_payment_cards_usecase.dart';
import 'package:anatomica/features/profile/domain/usecases/create_payment_cards_usecase.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPaymentCardVerifyScreen extends StatefulWidget {
  const AddPaymentCardVerifyScreen(
      {required this.cardNumber, required this.expiredDate, Key? key})
      : super(key: key);
  final String cardNumber;
  final String expiredDate;

  @override
  State<AddPaymentCardVerifyScreen> createState() =>
      _AddPaymentCardVerifyScreenState();
}

class _AddPaymentCardVerifyScreenState
    extends State<AddPaymentCardVerifyScreen> {
  late TextEditingController pinCodeController;

  int secondsLeft = 0;
  bool hasError = false;
  @override
  initState() {
    super.initState();
    pinCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScreen(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: WAppBar(title: LocaleKeys.add_card.tr(), hasUnderline: true),
          body: BlocBuilder<PaymentCardsBloc, PaymentCardsState>(
            builder: (context, state) {
              print(
                  'state 2 => ${context.read<PaymentCardsBloc>().state.createCardResponseModel}');
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(bottom: MediaQuery.of(context).padding.bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      LocaleKeys.confirm.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      LocaleKeys.v_c_h_b_s_t_y_p_n.tr(),
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 20),
                    WScaleAnimation(
                      onTap: () {
                        // context
                        //     .read<LoginSignUpBloc>()
                        //     .add(SetTimer(secondsLeft: secondsLeft));
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 6, 10, 8),
                        height: 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: primary.withOpacity(0.12),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 24,
                              offset: const Offset(0, 8),
                              color: chipShadowColor.withOpacity(0.19),
                            ),
                          ],
                          border: Border.all(width: 1, color: primary),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${state.createCardResponseModel?.otpSentPhone}',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    PinCodeBody(
                      onChanged: (v) {
                        if (hasError) {
                          hasError = false;
                          setState(() {});
                        }
                      },
                      onTimeChanged: (seconds) {
                        secondsLeft = seconds;
                      },
                      hasError: hasError,
                      pinCodeController: pinCodeController,
                      secondsLeft: secondsLeft,
                      onRefresh: () {
                        context.read<PaymentCardsBloc>().add(
                              CreatePaymentCardEvent(
                                onSucces: () {},
                                onError: (message) {
                                  context.read<ShowPopUpBloc>().add(ShowPopUp(
                                      message: message, isSuccess: false));
                                },
                                param: CreateCardParam(
                                  cardNumber: widget.cardNumber,
                                  expireDate: widget.expiredDate,
                                ),
                              ),
                            );
                      },
                    ),
                    const Spacer(),
                    WButton(
                      onTap: () {
                        context.read<PaymentCardsBloc>().add(
                              ConfirmPaymentCardEvent(
                                onSucces: () {
                                  Navigator.of(context).pop();
                                  context.read<ShowPopUpBloc>().add(
                                        ShowPopUp(
                                          // todo locale
                                          message: 'Карта успешно добавлена',
                                          isSuccess: true,
                                        ),
                                      );
                                },
                                onError: (message) {
                                  hasError = true;
                                  context.read<ShowPopUpBloc>().add(ShowPopUp(
                                      message: message, isSuccess: false));
                                },
                                param: ConfirmCardParam(
                                  cardNumber: widget.cardNumber,
                                  session: 0,
                                  otp: pinCodeController.text,
                                ),
                              ),
                            );
                      },
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 16),
                      text: LocaleKeys.to_main.tr(),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
