import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/bloc/login_sign_up_bloc/login_sign_up_bloc.dart';
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

class RegisterVerify extends StatefulWidget {
  final PageController pageController;

  const RegisterVerify({required this.pageController, Key? key}) : super(key: key);

  @override
  State<RegisterVerify> createState() => _RegisterVerifyState();
}

class _RegisterVerifyState extends State<RegisterVerify> {
  late TextEditingController pinCodeController;
  int secondsLeft = 0;

  @override
  initState() {
    pinCodeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(DateTime.now());
    return BlocBuilder<LoginSignUpBloc, LoginSignUpState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16 + MediaQuery.of(context).padding.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  WScaleAnimation(
                    onTap: () {
                      context.read<LoginSignUpBloc>().add(SetTimer(secondsLeft: secondsLeft));
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
                            state.phoneEmail,
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
                pinCodeController: pinCodeController,
                secondsLeft: state.secondsLeft,
                onRefresh: () {
                  context.read<LoginSignUpBloc>().add(ResendCode());
                },
              ),
              const Spacer(),
              WButton(
                text: LocaleKeys.confirm.tr(),
                isLoading: state.submitCodeStatus.isSubmissionInProgress,
                onTap: () {
                  context.read<LoginSignUpBloc>().add(
                        SubmitCode(
                          code: pinCodeController.text,
                          onSuccess: () {
                            widget.pageController
                                .nextPage(duration: const Duration(milliseconds: 150), curve: Curves.linear);
                          },
                          onError: (message) {
                            context.read<ShowPopUpBloc>().add(
                                  ShowPopUp(message: message.replaceAll(RegExp(r'\{?\[?\]?\.?}?'), '')),
                                );
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
