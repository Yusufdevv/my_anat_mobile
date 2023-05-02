import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/bloc/login_sign_up_bloc/login_sign_up_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/default_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/phone_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class RegisterPhone extends StatefulWidget {
  final TabController tabController;
  final PageController pageController;

  const RegisterPhone(
      {required this.pageController, required this.tabController, Key? key})
      : super(key: key);

  @override
  State<RegisterPhone> createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone>
    with AutomaticKeepAliveClientMixin {
  late TextEditingController phoneController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<LoginSignUpBloc, LoginSignUpState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Container(
                decoration: BoxDecoration(
                  color: lilyWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 36,
                child: TabBar(
                  padding: const EdgeInsets.all(2),
                  indicator: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                        color: chipShadowColor.withOpacity(0.19),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6),
                    color: white,
                  ),
                  controller: widget.tabController,
                  indicatorPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  onTap: (index) {
                    context.read<LoginSignUpBloc>().add(ChangeConfirmationType(
                        type: index == 0 ? 'phone' : 'email'));
                  },
                  unselectedLabelStyle:
                      Theme.of(context).textTheme.displaySmall,
                  labelStyle: Theme.of(context).textTheme.displaySmall,
                  unselectedLabelColor: textSecondary,
                  labelColor: textColor,
                  tabs: [
                    Text(LocaleKeys.phone_number.tr()),
                    Text(
                      LocaleKeys.mail.tr(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 0,
              thickness: 1,
              color: textFieldColor,
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: widget.tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: PhoneTextField(
                      title: LocaleKeys.phone_number.tr(),
                      controller: phoneController,
                      hasError: state.confirmationType == 'phone' &&
                          state.submitPhoneEmailStatus.isSubmissionFailure,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: DefaultTextField(
                      maxLines: 1,
                      title: LocaleKeys.mail.tr(),
                      controller: emailController,
                      hasError: state.confirmationType == 'email' &&
                          state.submitPhoneEmailStatus.isSubmissionFailure,
                      onChanged: (value) {},
                      prefix: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 8),
                        child: SvgPicture.asset(AppIcons.mail),
                      ),
                      hintText: 'example@anatomica.uz',
                    ),
                  ),
                ],
              ),
            ),
            WButton(
              margin: EdgeInsets.fromLTRB(
                  16, 16, 16, 16 + MediaQuery.of(context).padding.bottom),
              isLoading: state.submitPhoneEmailStatus.isSubmissionInProgress,
              isDisabled: widget.tabController.index == 0
                  ? phoneController.text.length != 12
                  : emailController.text.length < 5,
              onTap: () {
                if (state.confirmationType == 'phone') {
                  if (state.phoneEmail.isNotEmpty) {
                    if (state.phoneEmail
                            .replaceAll(RegExp(r'\(?\)?-? ?'), '') ==
                        '+998${phoneController.text.replaceAll(RegExp(r' '), '')}') {
                      widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 150),
                          curve: Curves.linear);
                    } else {
                      context.read<LoginSignUpBloc>().add(
                            SubmitChangedPhone(
                              phone:
                                  '+998${phoneController.text.replaceAll(RegExp(r' '), '')}',
                              onError: (message) {
                                context.read<ShowPopUpBloc>().add(ShowPopUp(
                                    message: message.replaceAll(
                                        RegExp(r'\{?\[?\]?\.?}?'), '')));
                              },
                              onSuccess: () {
                                widget.pageController.nextPage(
                                    duration: const Duration(milliseconds: 150),
                                    curve: Curves.linear);
                              },
                            ),
                          );
                    }
                  } else {
                    context.read<LoginSignUpBloc>().add(
                          SubmitPhone(
                            phone:
                                '+998${phoneController.text.replaceAll(RegExp(r' '), '')}',
                            onError: (message) {
                              context.read<ShowPopUpBloc>().add(ShowPopUp(
                                  message: message.replaceAll(
                                      RegExp(r'\{?\[?\]?\.?}?'), '')));
                            },
                            onSuccess: () {
                              widget.pageController.nextPage(
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.linear);
                            },
                          ),
                        );
                  }
                } else if (state.confirmationType == 'email') {
                  if (state.phoneEmail.isNotEmpty) {
                    if (state.phoneEmail == emailController.text) {
                      widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 150),
                          curve: Curves.linear);
                    } else {
                      context.read<LoginSignUpBloc>().add(
                            SubmitChangedEmail(
                              email: emailController.text,
                              onError: (message) {
                                context.read<ShowPopUpBloc>().add(ShowPopUp(
                                    message: message.replaceAll(
                                        RegExp(r'\{?\[?\]?\.?}?'), '')));
                              },
                              onSuccess: () {
                                widget.pageController.nextPage(
                                    duration: const Duration(milliseconds: 150),
                                    curve: Curves.linear);
                              },
                            ),
                          );
                    }
                  } else {
                    context.read<LoginSignUpBloc>().add(
                          SubmitEmail(
                            email: emailController.text,
                            onError: (message) {
                              context.read<ShowPopUpBloc>().add(ShowPopUp(
                                  message: message.replaceAll(
                                      RegExp(r'\{?\[?\]?\.?}?'), '')));
                            },
                            onSuccess: () {
                              widget.pageController.nextPage(
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.linear);
                            },
                          ),
                        );
                  }
                }
              },
              text: LocaleKeys.confirm.tr(),
            )
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
