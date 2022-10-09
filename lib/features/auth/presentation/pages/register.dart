import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/auth/presentation/bloc/login_sign_up_bloc/login_sign_up_bloc.dart';
import 'package:anatomica/features/auth/presentation/pages/password.dart';
import 'package:anatomica/features/auth/presentation/widgets/auth_header.dart';
import 'package:anatomica/features/auth/presentation/widgets/register_feed.dart';
import 'package:anatomica/features/auth/presentation/widgets/register_phone.dart';
import 'package:anatomica/features/auth/presentation/widgets/register_verify.dart';
import 'package:anatomica/features/auth/presentation/widgets/registration_progress.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
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
    return CustomScreen(
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
                      padding: const EdgeInsets.symmetric(horizontal: 16)
                          .copyWith(bottom: 42),
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
                      pageController: pageController,
                    ),
                    RegisterPhone(
                      tabController: tabController,
                      pageController: pageController,
                    ),
                    RegisterVerify(
                      pageController: pageController,
                    ),
                    const PasswordScreen()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTitle(int currentPage) {
    switch (currentPage) {
      case 0:
        return LocaleKeys.register.tr();
      case 1:
        return LocaleKeys.contact_details.tr();
      case 2:
        return LocaleKeys.verify.tr();
      case 3:
        return LocaleKeys.safety.tr();
      default:
        return '';
    }
  }

  String _getSubtitle(int currentPage) {
    switch (currentPage) {
      case 0:
        return LocaleKeys.register_text.tr();
      case 1:
        return LocaleKeys.enter_contact_details.tr();
      case 2:
        return LocaleKeys.write_sms_code.tr();
      case 3:
        return LocaleKeys.registered_password.tr();
      default:
        return '';
    }
  }
}
