import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/pages/password.dart';
import 'package:anatomica/features/auth/presentation/widgets/registation_header.dart';
import 'package:anatomica/features/auth/presentation/widgets/register_feed.dart';
import 'package:anatomica/features/auth/presentation/widgets/register_phone.dart';
import 'package:anatomica/features/auth/presentation/widgets/register_verify.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        body: NestedScrollView(
          headerSliverBuilder: (context, isHeaderScrolled) => [
            SliverAppBar(
              stretch: true,
              expandedHeight: 180 + MediaQuery.of(context).padding.top,
              titleSpacing: 0,
              leadingWidth: 0,
              elevation: 0,
              pinned: true,
              floating: true,
              centerTitle: false,
              collapsedHeight: 80 + MediaQuery.of(context).padding.top,
              toolbarHeight: 80 + MediaQuery.of(context).padding.top,
              automaticallyImplyLeading: false,
              backgroundColor: darkGreen,
              title: Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Column(
                  children: [
                    WScaleAnimation(
                        onTap: () => Navigator.of(context).pop(),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 16, bottom: 16, left: 16),
                          child: SvgPicture.asset(AppIcons.chevronLeft),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: SvgPicture.asset(AppIcons.logo),
                    ),
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(_getTitle(currentPage),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontSize: 28, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 8),
                      Text(
                        _getSubtitle(currentPage),
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: RegistrationHeader(currentPage: currentPage),
            )
          ],
          body: Container(
            color: primary,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                color: white,
              ),
              padding: const EdgeInsets.only(top: 16),
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
        ),
      ),
      //
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
