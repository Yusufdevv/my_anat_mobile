import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WTextField(
          title: 'Новый пароль',
          onChanged: (v) {},
          prefix: Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
            child: SvgPicture.asset(AppIcons.key),
          ),
          hintText: 'Введите новый пароль',
          isObscure: true,
        ),
        WTextField(
          title: 'Подтвердите новый пароль',
          onChanged: (v) {},
          prefix: Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
            child: SvgPicture.asset(AppIcons.key),
          ),
          hintText: 'Подтвердите новый пароль',
          isObscure: true,
        ),
        const Spacer(),
        WButton(
          onTap: () {},
          text: 'Сохранить',
        )
      ],
    );
  }
}
