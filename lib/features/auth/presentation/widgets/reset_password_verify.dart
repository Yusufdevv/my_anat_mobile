import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/bloc/reset_password_bloc/reset_password_bloc.dart';
import 'package:anatomica/features/auth/presentation/widgets/pin_code_body.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class ResetPasswordVerify extends StatefulWidget {
  final PageController pageController;

  const ResetPasswordVerify({required this.pageController, Key? key}) : super(key: key);

  @override
  State<ResetPasswordVerify> createState() => _ResetPasswordVerifyState();
}

class _ResetPasswordVerifyState extends State<ResetPasswordVerify> {
  late TextEditingController pinCodeController;
  int secondsLeft = 0;
  @override
  initState() {
    pinCodeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        print(state.submitCodeStatus);
        return Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16 + MediaQuery.of(context).padding.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  WScaleAnimation(
                    onTap: () {
                      context.read<ResetPasswordBloc>().add(SetTime(secondsLeft: secondsLeft));
                      widget.pageController
                          .previousPage(duration: const Duration(milliseconds: 150), curve: Curves.linear);
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
                        children: [
                          Text(
                            state.emailPhoneNumber,
                            style: Theme.of(context).textTheme.headline1!.copyWith(),
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset(AppIcons.edit),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              PinCodeBody(
                onTimeChanged: (seconds) {
                  secondsLeft = seconds;
                },
                hasError: state.submitCodeStatus.isSubmissionFailure,
                secondsLeft: state.secondsLeft,
                pinCodeController: pinCodeController,
                errorText: 'Kod xato',
                onRefresh: () {
                  context.read<ResetPasswordBloc>().add(ResendCode());
                },
              ),
              const Spacer(),
              WButton(
                text: LocaleKeys.confirm.tr(),
                isLoading: state.submitCodeStatus.isSubmissionInProgress,
                onTap: () {
                  context.read<ResetPasswordBloc>().add(
                        VerifyCode(
                          code: pinCodeController.text,
                          onSuccess: () {
                            widget.pageController
                                .nextPage(duration: const Duration(milliseconds: 150), curve: Curves.linear);
                          },
                          onError: (message) {
                            context.read<ShowPopUpBloc>().add(ShowPopUp(message: message));
                          },
                        ),
                      );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
