import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/bloc/login_sign_up_bloc/login_sign_up_bloc.dart';
import 'package:anatomica/features/auth/presentation/pages/login.dart';
import 'package:anatomica/features/auth/presentation/widgets/info_container.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/default_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RegisterFeed extends StatefulWidget {
  final PageController pageController;

  const RegisterFeed({required this.pageController, Key? key})
      : super(key: key);

  @override
  State<RegisterFeed> createState() => _RegisterFeedState();
}

class _RegisterFeedState extends State<RegisterFeed> {
  late TextEditingController loginController;
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    loginController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginSignUpBloc, LoginSignUpState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
              16, 0, 16, 16 + MediaQuery.of(context).padding.bottom),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    DefaultTextField(
                      title: LocaleKeys.name.tr(),
                      maxLines: 1,
                      controller: nameController,
                      onChanged: (value) {},
                      hasError: nameController.text.isEmpty &&
                          state.checkUsernameStatus.isSubmissionFailure,
                      prefix: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 8),
                        child: SvgPicture.asset(AppIcons.user),
                      ),
                      hintText: LocaleKeys.write_full_name.tr(),
                    ),
                    const SizedBox(height: 16),
                    DefaultTextField(
                      title: LocaleKeys.login.tr(),
                      controller: loginController,
                      onChanged: (value) {},
                      maxLines: 1,
                      hasError: state.checkUsernameStatus.isSubmissionFailure,
                      prefix: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 8),
                        child: SvgPicture.asset(AppIcons.user),
                      ),
                      hintText: LocaleKeys.create_login.tr(),
                    ),
                    const SizedBox(height: 12),
                    const InfoContainer(),
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text.rich(
                TextSpan(
                    text: LocaleKeys.privacy_1.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: [
                      TextSpan(
                        text: LocaleKeys.privacy_2.tr(),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            if (await canLaunchUrlString(
                                'https://anatomica.uz/privacy-policy')) {
                              await launchUrlString(
                                  'https://anatomica.uz/privacy-policy',
                                  mode: LaunchMode.externalApplication);
                            }
                          },
                        onEnter: (_) {},
                        onExit: (_) {},
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: primary),
                      ),
                      TextSpan(
                          text: LocaleKeys.privacy_3.tr(),
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: const []),
                    ]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              WButton(
                text: LocaleKeys.proceed.tr(),
                isLoading: state.checkUsernameStatus.isSubmissionInProgress,
                onTap: () {
                  context.read<LoginSignUpBloc>().add(
                        CheckUsername(
                          username: loginController.text,
                          fullName: nameController.text,
                          onError: (message) {
                            context.read<ShowPopUpBloc>().add(ShowPopUp(
                                message:
                                    message.replaceAll(RegExp(r'{?}?'), '')));
                          },
                          onSuccess: () {
                            widget.pageController.animateToPage(1,
                                duration: const Duration(milliseconds: 150),
                                curve: Curves.linear);
                          },
                        ),
                      );
                },
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.already_has.tr(),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(),
                  ),
                  const SizedBox(width: 4),
                  WScaleAnimation(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(fade(page: const LoginScreen()));
                    },
                    child: Text(
                      LocaleKeys.enter.tr(),
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
