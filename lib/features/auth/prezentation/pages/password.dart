import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_textfield.dart';
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
    return Column(
      children: [
        WTextField(
          onChanged: (v) {},
          title: 'Пароль',
        ),
        const SizedBox(height: 16),
        WTextField(
          onChanged: (v) {},
          title: 'Подтвердите пароль',
        ),
        const Spacer(),
        WButton(
          text: 'Подтвердить',
          onTap: widget.onTap,
        )
      ],
    );
  }
}
