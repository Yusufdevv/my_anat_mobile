import 'package:anatomica/features/auth/presentation/bloc/reset_password_bloc/reset_password_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/password_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                title: 'Новый пароль',
                controller: passwordController,
                onChanged: (value) {},
                hintText: 'Введите новый пароль',
              ),
              const SizedBox(height: 16),
              PasswordTextField(
                title: 'Подтвердите новый пароль',
                controller: confirmPasswordController,
                onChanged: (value) {},
                hintText: 'Подтвердите новый пароль',
              ),
              const Spacer(),
              WButton(
                onTap: () {
                  context.read<ResetPasswordBloc>().add(SubmitPassword(
                      confirmPassword: confirmPasswordController.text,
                      password: passwordController.text,
                      onError: (message) {}));
                },
                text: 'Сохранить',
              ),
            ],
          ),
        );
      },
    );
  }
}
