import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/auth/presentation/widgets/pin_code_body.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPaymentCardVerifyScreen extends StatefulWidget {
  const AddPaymentCardVerifyScreen({Key? key}) : super(key: key);

  @override
  State<AddPaymentCardVerifyScreen> createState() =>
      _AddPaymentCardVerifyScreenState();
}

class _AddPaymentCardVerifyScreenState
    extends State<AddPaymentCardVerifyScreen> {
  late TextEditingController pinCodeController;

  int secondsLeft = 0;

  @override
  initState() {
    pinCodeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScreen(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: WAppBar(title: LocaleKeys.add_card.tr(), hasUnderline: true),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          '+998 99 7** ** 44',
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
                  onTimeChanged: (seconds) {
                    secondsLeft = seconds;
                  },
                  hasError: false,
                  pinCodeController: pinCodeController,
                  secondsLeft: secondsLeft,
                  onRefresh: () {
                    // context.read<LoginSignUpBloc>().add(ResendCode());
                  },
                ),
                const Spacer(),
                WButton(
                  onTap: () {
                    context.read<ShowPopUpBloc>().add(ShowPopUp(
                        message: 'Карта успешно добавлена', isSuccess: true));
                    Navigator.pop(context);
                  },
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 16),
                  text: LocaleKeys.to_main.tr(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
