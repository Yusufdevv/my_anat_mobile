import 'package:anatomica/features/auth/presentation/bloc/login_sign_up_bloc/login_sign_up_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/password_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginSignUpBloc, LoginSignUpState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16 + MediaQuery.of(context).padding.bottom),
          child: Column(
            children: [
              PasswordTextField(
                title: 'Пароль',
                controller: passwordController,
                onChanged: (value) {},
                hintText: 'Введите пароль',
              ),
              const SizedBox(height: 16),
              PasswordTextField(
                title: 'Подтвердите пароль',
                controller: confirmPasswordController,
                onChanged: (value) {},
                hintText: 'Подтвердите пароль',
              ),
              const Spacer(),
              WButton(
                text: 'Подтвердить',
                isLoading: state.submitPasswordStatus.isSubmissionInProgress,
                onTap: () {
                  context.read<LoginSignUpBloc>().add(SubmitPassword(
                      confirmPassword: confirmPasswordController.text,
                      password: passwordController.text,
                      onError: (message) {
                        context.read<ShowPopUpBloc>().add(ShowPopUp(message: message));
                      }));
                },
              )
            ],
          ),
        );
      },
    );
  }
}
