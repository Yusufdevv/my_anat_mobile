import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/password_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/profile/data/repositories/profile_impl.dart';
import 'package:anatomica/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:anatomica/features/profile/presentation/blocs/change_password_bloc/change_password_bloc.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

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
    return BlocProvider(
      create: (context) => ChangePasswordBloc(
          changePasswordUseCase: ChangePasswordUseCase(repository: serviceLocator<ProfileRepositoryImpl>())),
      child: BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
        builder: (context, state) {
          return CustomScreen(
            child: Scaffold(
              appBar: WAppBar(title: LocaleKeys.safety.tr(), hasUnderline: true),
              bottomNavigationBar: WButton(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 12 + mediaQuery.padding.bottom),
                text: LocaleKeys.next.tr(),
                isLoading: state.changePasswordStatus.isSubmissionInProgress,
                onTap: () {
                  context.read<ChangePasswordBloc>().add(
                        ChangePassword(
                            newPassword: newPasswordController.text,
                            currentPassword: oldPasswordController.text,
                            onSuccess: () {
                              Navigator.of(context).pop();
                            },
                            newPasswordConfirmed: confirmNewPasswordController.text,
                            onFailure: (message) => context.read<ShowPopUpBloc>().add(ShowPopUp(message: message))),
                      );
                },
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
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    PasswordTextField(
                      controller: oldPasswordController,
                      title: LocaleKeys.old_password.tr(),
                      hintText: LocaleKeys.write_old_password.tr(),
                      onChanged: (v) {},
                      prefixIcon: AppIcons.changePasswordLock,
                    ),
                    const SizedBox(height: 16),
                    PasswordTextField(
                      controller: newPasswordController,
                      title: LocaleKeys.new_password.tr(),
                      hintText: LocaleKeys.write_password.tr(),
                      onChanged: (v) {},
                      prefixIcon: AppIcons.changePasswordLock,
                    ),
                    const SizedBox(height: 16),
                    PasswordTextField(
                      controller: confirmNewPasswordController,
                      title: LocaleKeys.password_confirm.tr(),
                      hintText: LocaleKeys.enter_password_again.tr(),
                      onChanged: (v) {},
                      prefixIcon: AppIcons.changePasswordLock,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
