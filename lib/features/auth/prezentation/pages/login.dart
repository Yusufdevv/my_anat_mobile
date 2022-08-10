import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/prezentation/pages/register.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: darkGreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 20 + mediaQuery.padding.top, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppIcons.logo),
                const SizedBox(height: 36),
                Text('Войти',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 28, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text(
                  'Уже есть аккаунт? Войдите, чтобы пользоваться всеми возможностями приложения',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
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
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  WButton(
                    text: 'Войти',
                    onTap: () {},
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
                          Navigator.of(context).push(fade(page: const RegisterScreen()));
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
          )
        ],
      ),
    );
  }
}
