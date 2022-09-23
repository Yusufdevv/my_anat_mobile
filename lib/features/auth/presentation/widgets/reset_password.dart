import 'package:anatomica/features/auth/presentation/bloc/reset_password_bloc/reset_password_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/password_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16 + MediaQuery.of(context).padding.bottom),
          child: Column(
            children: [
              PasswordTextField(
                title: LocaleKeys.new_password.tr(),
                controller: passwordController,
                onChanged: (value) {},
                hasError: state.submitPasswordStatus.isSubmissionFailure,
                hintText: LocaleKeys.write_new_password.tr(),
              ),
              const SizedBox(height: 16),
              PasswordTextField(
                title: LocaleKeys.confirm_new_password.tr(),
                controller: confirmPasswordController,
                hasError: state.submitPasswordStatus.isSubmissionFailure,
                onChanged: (value) {},
                hintText: LocaleKeys.confirm_new_password.tr(),
              ),
              const Spacer(),
              WButton(
                isLoading: state.submitPasswordStatus.isSubmissionInProgress,
                onTap: () {
                  context.read<ResetPasswordBloc>().add(
                        SubmitPassword(
                          confirmPassword: confirmPasswordController.text,
                          password: passwordController.text,
                          onError: (message) {
                            context.read<ShowPopUpBloc>().add(ShowPopUp(message: message));
                          },
                        ),
                      );
                },
                text: LocaleKeys.save.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
