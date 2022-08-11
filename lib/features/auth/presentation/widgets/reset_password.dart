import 'package:anatomica/features/common/presentation/widgets/password_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16 + MediaQuery.of(context).padding.bottom),
      child: Column(
        children: [
          PasswordTextField(
            title: 'Новый пароль',
            controller: TextEditingController(),
            onChanged: (value) {},
            hintText: 'Введите новый пароль',
          ),
          const SizedBox(height: 16),
          PasswordTextField(
            title: 'Подтвердите новый пароль',
            controller: TextEditingController(),
            onChanged: (value) {},
            hintText: 'Подтвердите новый пароль',
          ),
          const Spacer(),
          WButton(
            onTap: () {},
            text: 'Сохранить',
          ),
        ],
      ),
    );
  }
}
