import 'package:anatomica/features/common/presentation/widgets/password_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  final VoidCallback onTap;

  const PasswordScreen({required this.onTap, Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16 + MediaQuery.of(context).padding.bottom),
      child: Column(
        children: [
          PasswordTextField(
            title: 'Пароль',
            controller: TextEditingController(),
            onChanged: (value) {},
            hintText: 'Введите пароль',
          ),
          const SizedBox(height: 16),
          PasswordTextField(
            title: 'Подтвердите пароль',
            controller: TextEditingController(),
            onChanged: (value) {},
            hintText: 'Подтвердите пароль',
          ),
          const Spacer(),
          WButton(
            text: 'Подтвердить',
            onTap: widget.onTap,
          )
        ],
      ),
    );
  }
}
