import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/auth/presentation/bloc/login_sign_up_bloc/login_sign_up_bloc.dart';
import 'package:anatomica/features/auth/presentation/pages/password.dart';
import 'package:anatomica/features/auth/presentation/pages/reset_password.dart';
import 'package:anatomica/features/auth/presentation/widgets/auth_header.dart';
import 'package:anatomica/features/auth/presentation/widgets/register_feed.dart';
import 'package:anatomica/features/auth/presentation/widgets/register_phone.dart';
import 'package:anatomica/features/auth/presentation/widgets/register_verify.dart';
import 'package:anatomica/features/auth/presentation/widgets/registration_progress.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  final LoginSignUpBloc bloc;

  const RegisterScreen({required this.bloc, Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with TickerProviderStateMixin {
  late PageController pageController;
  late TabController tabController;
  int currentPage = 0;

  @override
  initState() {
    pageController = PageController();
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  dispose() {
    pageController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: WKeyboardDismisser(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: darkGreen,
          body: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 69,
                        decoration: const BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                      ),
                      Container(
                        height: 16,
                        decoration: BoxDecoration(
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, -4),
                              blurRadius: 20,
                              color: woodSmoke.withOpacity(0.06),
                            )
                          ],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthHeader(
                        title: _getTitle(currentPage),
                        subTitle: _getSubtitle(currentPage),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 42),
                        child: RegistrationProgress(
                          currentPosition: currentPage,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Expanded(
                child: Container(
                  color: white,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    controller: pageController,
                    children: [
                      RegisterFeed(
                        onTap: () {
                          pageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.linear);
                        },
                      ),
                      RegisterPhone(
                        tabController: tabController,
                        onTap: () {
                          pageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.linear);
                        },
                      ),
                      RegisterVerify(
                        onTap: () {
                          pageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.linear);
                        },
                      ),
                      PasswordScreen(
                        onTap: () {
                          Navigator.of(context).push(fade(page: const ResetPasswordScreen()));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getTitle(int currentPage) {
    switch (currentPage) {
      case 0:
        return 'Регистрация';
      case 1:
        return 'Контактные данные';
      case 2:
        return 'Верификация';
      case 3:
        return 'Безопасность';
      default:
        return '';
    }
  }

  String _getSubtitle(int currentPage) {
    switch (currentPage) {
      case 0:
        return 'Чтобы воспользоваться всеми возможностями, пожалуйста, зарегистрируйтесь';
      case 1:
        return 'Чтобы зарегистрироваться, пожалуйста, введите контактные данные';
      case 2:
        return 'Введите код который был отправлен на номер';
      case 3:
        return 'Ваш аккаунт, регистрирован. Осталось введит надежный пароль';
      default:
        return '';
    }
  }
}
