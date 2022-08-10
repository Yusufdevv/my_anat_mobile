import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/prezentation/pages/password.dart';
import 'package:anatomica/features/auth/prezentation/pages/reset_password.dart';
import 'package:anatomica/features/auth/prezentation/widgets/register_feed.dart';
import 'package:anatomica/features/auth/prezentation/widgets/register_item.dart';
import 'package:anatomica/features/auth/prezentation/widgets/register_phone.dart';
import 'package:anatomica/features/auth/prezentation/widgets/register_verify.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with TickerProviderStateMixin {
  late PageController pageController;
  late TabController tabController;

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
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
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
              Padding(
                padding: EdgeInsets.fromLTRB(16, 20 + mediaQuery.padding.top, 16, 40),
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
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: const [
                        RegisterItem(icon: AppIcons.cliboardList),
                        RegisterItem(icon: AppIcons.deviceMobile),
                        RegisterItem(icon: AppIcons.shield),
                        RegisterItem(icon: AppIcons.key, isLast: true),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16 + mediaQuery.padding.bottom),
              decoration: const BoxDecoration(color: white),
              child: PageView(
                controller: pageController,
                children: [
                  RegisterFeed(onTap: () {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
                  }),
                  RegisterPhone(
                    tabController: tabController,
                    onTap: () {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
                    },
                  ),
                  RegisterVerify(
                    onTap: () {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
                    },
                  ),
                  PasswordScreen(onTap: () {
                    Navigator.of(context).push(fade(page: const ResetPasswordScreen()));
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
