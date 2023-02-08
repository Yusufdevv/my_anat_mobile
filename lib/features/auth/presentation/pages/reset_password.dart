import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:anatomica/features/auth/data/repositories/reset_password_repository_impl.dart';
import 'package:anatomica/features/auth/domain/usecases/create_reset_password_new_state_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/resend_password_reset_code_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_changed_reset_password_email_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_changed_reset_password_phone_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_reset_password_email_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_reset_password_phone_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_reset_password_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/verify_reset_password_code_usecase.dart';
import 'package:anatomica/features/auth/presentation/bloc/reset_password_bloc/reset_password_bloc.dart';
import 'package:anatomica/features/auth/presentation/widgets/reset_password.dart';
import 'package:anatomica/features/auth/presentation/widgets/reset_password_body.dart';
import 'package:anatomica/features/auth/presentation/widgets/reset_password_verify.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return BlocProvider(
      create: (context) => ResetPasswordBloc(
        createResetPasswordNewStateUseCase: CreateResetPasswordNewStateUseCase(
          repository: serviceLocator<ResetPasswordRepositoryImpl>(),
        ),
        submitChangedResetPasswordEmailUseCase:
            SubmitChangedResetPasswordEmailUseCase(
          repository: serviceLocator<ResetPasswordRepositoryImpl>(),
        ),
        submitChangedResetPasswordPhoneUseCase:
            SubmitChangedResetPasswordPhoneUseCase(
          repository: serviceLocator<ResetPasswordRepositoryImpl>(),
        ),
        submitResetPasswordEmailUseCase: SubmitResetPasswordEmailUseCase(
          repository: serviceLocator<ResetPasswordRepositoryImpl>(),
        ),
        submitResetPasswordPhoneUseCase: SubmitResetPasswordPhoneUseCase(
          repository: serviceLocator<ResetPasswordRepositoryImpl>(),
        ),
        submitResetPasswordUseCase: SubmitResetPasswordUseCase(
          repository: serviceLocator<AuthenticationRepositoryImpl>(),
        ),
        verifyResetPasswordCodeUseCase: VerifyResetPasswordCodeUseCase(
          repository: serviceLocator<ResetPasswordRepositoryImpl>(),
        ),
        resendPasswordResetCodeUseCase: ResendPasswordResetCodeUseCase(
          repository: serviceLocator<ResetPasswordRepositoryImpl>(),
        ),
      ),
      child: CustomScreen(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: darkGreen,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WScaleAnimation(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          16, mediaQuery.padding.top + 32, 16, 36),
                      child: SvgPicture.asset(AppIcons.arrowLeft),
                    ),
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
                              .displayMedium!
                              .copyWith(
                                  fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _getSubtitle(currentPage),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                        )
                      ],
                    ),
                  ),
                ],
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
                      ResetPasswordVerify(
                        pageController: pageController,
                      ),
                      const ResetPassword()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _getTitle(int currentPage) {
    switch (currentPage) {
      case 0:
        return LocaleKeys.recovery_password.tr();
      case 1:
        return LocaleKeys.verify.tr();
      case 2:
        return LocaleKeys.recovery_password.tr();
      default:
        return '';
    }
  }

  String _getSubtitle(int currentPage) {
    switch (currentPage) {
      case 0:
        return LocaleKeys.forgot_recovery.tr();
      case 1:
        return LocaleKeys.write_sms_code.tr();
      case 2:
        return LocaleKeys.forgot_recovery.tr();
      default:
        return '';
    }
  }
}
