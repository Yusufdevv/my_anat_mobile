import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/widgets/register_verify.dart';
import 'package:anatomica/features/auth/presentation/widgets/reset_password.dart';
import 'package:anatomica/features/auth/presentation/widgets/reset_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool isPhone = true;
  late PageController pageController;
  int currentPage = 0;

  @override
  initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: darkGreen,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 260,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, mediaQuery.padding.top + 32, 16, 36),
                    child: SvgPicture.asset(AppIcons.arrowLeft),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getTitle(currentPage),
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _getSubtitle(currentPage),
                          style: Theme.of(context).textTheme.headline2!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 16),
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  controller: pageController,
                  children: [
                    ResetPasswordBody(pageController: pageController),
                    RegisterVerify(
                      onTap: () {
                        pageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
                      },
                    ),
                    const ResetPassword()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getTitle(int currentPage) {
    switch (currentPage) {
      case 0:
        return 'Восстановление пароля';
      case 1:
        return 'Верификация';
      case 2:
        return 'Восстановление пароля';
      default:
        return '';
    }
  }

  String _getSubtitle(int currentPage) {
    switch (currentPage) {
      case 0:
        return 'Забыли свой пароль? Восстановите его быстро и наслаждайтесь приложением';
      case 1:
        return 'Введите код который был отправлен на номер';
      case 2:
        return 'Забыли свой пароль? Восстановите его быстро и наслаждайтесь приложением';
      default:
        return '';
    }
  }
}
