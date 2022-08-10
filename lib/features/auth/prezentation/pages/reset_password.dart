import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/prezentation/widgets/register_verify.dart';
import 'package:anatomica/features/auth/prezentation/widgets/reset_password.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/common/presentation/widgets/w_textfield.dart';
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
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 32 + mediaQuery.padding.top, 16, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppIcons.arrowLeft),
                  const SizedBox(height: 36),
                  Text(
                    'Восстановление пароля',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 28, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Забыли свой пароль? Восстановите его быстро и наслаждайтесь приложением',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8 + mediaQuery.padding.bottom),
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: PageView(
                  controller: pageController,
                  children: [
                    Column(
                      children: [
                        isPhone
                            ? WTextField(
                                title: 'Номер телефона',
                                onChanged: (v) {},
                              )
                            : WTextField(
                                title: 'Электронная почта',
                                onChanged: (v) {},
                              ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Восстановить через',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(width: 4),
                            isPhone
                                ? WScaleAnimation(
                                    onTap: () {
                                      setState(
                                        () {
                                          isPhone = false;
                                        },
                                      );
                                    },
                                    child: Text(
                                      'электронную почту',
                                      style: Theme.of(context).textTheme.headline4!.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                  )
                                : WScaleAnimation(
                                    onTap: () {
                                      setState(() {
                                        isPhone = true;
                                      });
                                    },
                                    child: Text(
                                      'номер телефона',
                                      style: Theme.of(context).textTheme.headline4!.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                  ),
                          ],
                        ),
                        const Spacer(),
                        WButton(
                          text: 'Далее',
                          onTap: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.bounceIn);
                          },
                        )
                      ],
                    ),
                    RegisterVerify(
                      onTap: () {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
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
}
