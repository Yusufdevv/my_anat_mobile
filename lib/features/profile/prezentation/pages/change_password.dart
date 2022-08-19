import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmNewPasswordController;

  @override
  initState() {
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
    super.initState();
  }

  @override
  dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return KeyboardDismisser(
      child: Scaffold(
        appBar: const WAppBar(title: 'Безопасность', hasUnderline: true),
        bottomNavigationBar: WButton(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 12 + mediaQuery.padding.bottom),
          text: 'Далее',
          onTap: () {},
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Придумайте новый пароль  и постарайтесь не забыть',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              WTextField(
                controller: oldPasswordController,
                title: 'Старый пароль',
                hintText: 'Введите старый пароль',
                hintTextStyle: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                  child: SvgPicture.asset(AppIcons.lock, color: textSecondary),
                ),
                onChanged: (v) {},
              ),
              const SizedBox(height: 16),
              WTextField(
                controller: newPasswordController,
                title: 'Новый пароль',
                hintText: 'Введите пароль',
                hintTextStyle: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                  child: SvgPicture.asset(AppIcons.lock, color: textSecondary),
                ),
                onChanged: (v) {},
              ),
              const SizedBox(height: 16),
              WTextField(
                controller: confirmNewPasswordController,
                title: 'Подтверждение пароля',
                hintText: 'Введите пароль ещё раз',
                hintTextStyle: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                  child: SvgPicture.asset(AppIcons.lock, color: textSecondary),
                ),
                onChanged: (v) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
