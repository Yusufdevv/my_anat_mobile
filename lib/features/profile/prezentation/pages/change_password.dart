import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/default_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
        appBar: WAppBar(title: LocaleKeys.safety.tr(), hasUnderline: true),
        bottomNavigationBar: WButton(
          margin:
              EdgeInsets.fromLTRB(16, 0, 16, 12 + mediaQuery.padding.bottom),
          text: LocaleKeys.next.tr(),
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
                    LocaleKeys.create_password.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              DefaultTextField(
                controller: oldPasswordController,
                title: LocaleKeys.old_password.tr(),
                hintText: LocaleKeys.write_old_password.tr(),
                // hintTextStyle: Theme.of(context)
                //     .textTheme
                //     .subtitle2!
                //     .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                  child: SvgPicture.asset(AppIcons.lock, color: textSecondary),
                ),
                onChanged: (v) {},
              ),
              const SizedBox(height: 16),
              DefaultTextField(
                controller: newPasswordController,
                title: LocaleKeys.new_password.tr(),
                hintText: LocaleKeys.write_password.tr(),
                // hintTextStyle: Theme.of(context)
                //     .textTheme
                //     .subtitle2!
                //     .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                  child: SvgPicture.asset(AppIcons.lock, color: textSecondary),
                ),
                onChanged: (v) {},
              ),
              const SizedBox(height: 16),
              DefaultTextField(
                controller: confirmNewPasswordController,
                title: LocaleKeys.password_confirm.tr(),
                hintText: LocaleKeys.enter_password_again.tr(),
                // hintTextStyle: Theme.of(context)
                //     .textTheme
                //     .subtitle2!
                //     .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
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
