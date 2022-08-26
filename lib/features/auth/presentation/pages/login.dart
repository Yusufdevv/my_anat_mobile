import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:anatomica/features/auth/domain/usecases/check_username_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/confirm_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/create_new_state_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/login_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/resend_code_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_changed_email_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_changed_phone_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_email_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_name_username_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_password_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_phone_usecase.dart';
import 'package:anatomica/features/auth/presentation/bloc/login_sign_up_bloc/login_sign_up_bloc.dart';
import 'package:anatomica/features/auth/presentation/pages/register.dart';
import 'package:anatomica/features/auth/presentation/pages/reset_password.dart';
import 'package:anatomica/features/auth/presentation/widgets/auth_header.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/default_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/password_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController passwordController;
  late TextEditingController loginController;

  @override
  void initState() {
    passwordController = TextEditingController();
    loginController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return CustomScreen(
      child: BlocProvider(
        create: (_) => LoginSignUpBloc(
          loginUseCase: LoginUseCase(
            repository: serviceLocator<AuthenticationRepositoryImpl>(),
          ),
          checkUsernameUseCase: CheckUsernameUseCase(
            repository: serviceLocator<AuthenticationRepositoryImpl>(),
          ),
          confirmUseCase: ConfirmUseCase(
            repository: serviceLocator<AuthenticationRepositoryImpl>(),
          ),
          createNewStateUseCase: CreateNewStateUseCase(
            repository: serviceLocator<AuthenticationRepositoryImpl>(),
          ),
          submitEmailUseCase: SubmitEmailUseCase(
            repository: serviceLocator<AuthenticationRepositoryImpl>(),
          ),
          submitNameUsernameUseCase: SubmitNameUserNameUseCase(
            repository: serviceLocator<AuthenticationRepositoryImpl>(),
          ),
          submitPasswordUseCase: SubmitPasswordUseCase(
            repository: serviceLocator<AuthenticationRepositoryImpl>(),
          ),
          submitPhoneUseCase: SubmitPhoneUseCase(
            repository: serviceLocator<AuthenticationRepositoryImpl>(),
          ),
          resendCodeUseCase: ResendCodeUseCase(
            repository: serviceLocator<AuthenticationRepositoryImpl>(),
          ),
          submitChangedEmailUseCase: SubmitChangedEmailUseCase(
            repository: serviceLocator<AuthenticationRepositoryImpl>(),
          ),
          submitChangedPhoneUseCase: SubmitChangedPhoneUseCase(
            repository: serviceLocator<AuthenticationRepositoryImpl>(),
          ),
        ),
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
          child: WKeyboardDismisser(
            child: BlocBuilder<LoginSignUpBloc, LoginSignUpState>(
              builder: (context, state) {
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: darkGreen,
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AuthHeader(
                        title: 'Войти',
                        subTitle: 'Уже есть аккаунт? Войдите, чтобы пользоваться всеми возможностями приложения',
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + mediaQuery.padding.bottom),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, -4),
                                blurRadius: 20,
                                color: woodSmoke.withOpacity(0.06),
                              )
                            ],
                            color: white,
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultTextField(
                                title: 'Логин',
                                controller: loginController,
                                onChanged: (value) {},
                                hasError: state.loginStatus.isSubmissionFailure,
                                hintText: 'Введите логин',
                                prefix: Padding(
                                  padding: const EdgeInsets.only(left: 12, right: 8),
                                  child: SvgPicture.asset(AppIcons.user),
                                ),
                              ),
                              const SizedBox(height: 16),
                              PasswordTextField(
                                title: 'Пароль',
                                hintText: 'Введите пароль',
                                hasError: state.loginStatus.isSubmissionFailure,
                                onChanged: (value) {},
                                controller: passwordController,
                              ),
                              WScaleAnimation(
                                onTap: () {
                                  Navigator.of(context).push(fade(page: const ResetPasswordScreen()));
                                },
                                scaleValue: 0.98,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                                  child: Text(
                                    'Забыли пароль?',
                                    style:
                                        Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14, color: primary),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              WButton(
                                text: 'Войти',
                                isLoading: state.loginStatus.isSubmissionInProgress,
                                onTap: () => context.read<LoginSignUpBloc>().add(
                                      Login(
                                        username: loginController.text,
                                        password: passwordController.text,
                                        onError: (message) {
                                          context.read<ShowPopUpBloc>().add(
                                                ShowPopUp(message: message.replaceAll(RegExp(r'\{?\[?\]?\.?}?'), '')),
                                              );
                                        },
                                      ),
                                    ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Нет аккаунта?',
                                    style: Theme.of(context).textTheme.subtitle2!.copyWith(),
                                  ),
                                  const SizedBox(width: 4),
                                  WScaleAnimation(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        fade(
                                          page: RegisterScreen(
                                            bloc: context.read<LoginSignUpBloc>(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Зарегистрироваться',
                                      style: Theme.of(context).textTheme.headline4!.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
