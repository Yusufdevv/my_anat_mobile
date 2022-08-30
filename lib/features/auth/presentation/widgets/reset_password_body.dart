import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/bloc/reset_password_bloc/reset_password_bloc.dart';
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

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody>
    with AutomaticKeepAliveClientMixin {
  bool isPhone = true;
  late TextEditingController phoneController;
  late TextEditingController emailController;

  @override
  void initState() {
    phoneController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
              16, 0, 16, MediaQuery.of(context).padding.bottom + 16),
          child: Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: isPhone
                    ? PhoneTextField(
                        title: LocaleKeys.phone_number.tr(),
                        controller: phoneController,
                      )
                    : DefaultTextField(
                        title: LocaleKeys.mail.tr(),
                        controller: emailController,
                        onChanged: (value) {},
                        prefix: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 8),
                          child: SvgPicture.asset(AppIcons.mail),
                        ),
                        hintText: LocaleKeys.write_mail.tr(),
                      ),
              ),
              Text.rich(
                TextSpan(
                  text: LocaleKeys.recovery_from.tr(),
                  style: Theme.of(context).textTheme.headline3,
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            isPhone = !isPhone;
                          });
                          context.read<ResetPasswordBloc>().add(
                                ChangeConfirmationType(
                                    confirmationType:
                                        isPhone ? 'phone' : 'email'),
                              );
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4, 16, 4, 16),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 150),
                            child: isPhone
                                ? Text(
                                    LocaleKeys.mail_u.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  )
                                : Text(
                                    LocaleKeys.phone_number_u.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              WButton(
                text: LocaleKeys.next.tr(),
                isLoading: state.createNewStateStatus.isSubmissionInProgress,
                onTap: () {
                  if (state.confirmationType == 'phone') {
                    if (state.emailPhoneNumber.isNotEmpty) {
                      if (state.emailPhoneNumber
                              .replaceAll(RegExp(r'\(?\)?-? ?'), '') ==
                          '+998${phoneController.text.replaceAll(RegExp(r' '), '')}') {
                        widget.pageController.nextPage(
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.linear);
                      } else {
                        context.read<ResetPasswordBloc>().add(
                              SubmitChangedPhone(
                                phone:
                                    '+998${phoneController.text.replaceAll(RegExp(r' '), '')}',
                                onError: (message) {
                                  context
                                      .read<ShowPopUpBloc>()
                                      .add(ShowPopUp(message: message));
                                },
                                onSuccess: () {
                                  widget.pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 150),
                                      curve: Curves.linear);
                                },
                              ),
                            );
                      }
                    } else {
                      context
                          .read<ResetPasswordBloc>()
                          .add(CreateNewState(onSuccess: () {
                        context.read<ResetPasswordBloc>().add(
                              SubmitPhone(
                                phone:
                                    '+998${phoneController.text.replaceAll(RegExp(r' '), '')}',
                                onSuccess: () {
                                  widget.pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 150),
                                      curve: Curves.linear);
                                },
                                onError: (message) {
                                  context
                                      .read<ShowPopUpBloc>()
                                      .add(ShowPopUp(message: message));
                                },
                              ),
                            );
                      }));
                    }
                  } else {
                    if (state.emailPhoneNumber.isNotEmpty) {
                      if (state.emailPhoneNumber == emailController.text) {
                        widget.pageController.nextPage(
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.linear);
                      } else {
                        context.read<ResetPasswordBloc>().add(
                              SubmitChangedEmail(
                                email: emailController.text,
                                onError: (message) {
                                  context
                                      .read<ShowPopUpBloc>()
                                      .add(ShowPopUp(message: message));
                                },
                                onSuccess: () {
                                  widget.pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 150),
                                      curve: Curves.linear);
                                },
                              ),
                            );
                      }
                    } else {
                      context
                          .read<ResetPasswordBloc>()
                          .add(CreateNewState(onSuccess: () {
                        context.read<ResetPasswordBloc>().add(
                              SubmitEmail(
                                email: emailController.text,
                                onSuccess: () {
                                  widget.pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 150),
                                      curve: Curves.linear);
                                },
                                onError: (message) {
                                  context
                                      .read<ShowPopUpBloc>()
                                      .add(ShowPopUp(message: message));
                                },
                              ),
                            );
                      }));
                    }
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
