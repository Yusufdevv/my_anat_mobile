import 'dart:async';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/profile/presentation/blocs/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:anatomica/features/profile/presentation/blocs/restore/restore_bloc.dart';
import 'package:anatomica/features/profile/presentation/widgets/popups/components/refresh_panel.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyChangedPhoneDialog extends StatefulWidget {
  final String phonenumber;
  final bool isEmail;
  const VerifyChangedPhoneDialog(
      {required this.phonenumber, required this.isEmail, Key? key})
      : super(key: key);

  @override
  State<VerifyChangedPhoneDialog> createState() =>
      _VerifyChangedPhoneDialogState();
}

class _VerifyChangedPhoneDialogState extends State<VerifyChangedPhoneDialog> {
  final TextEditingController pinCodeController = TextEditingController();
  late StreamController<ErrorAnimationType> _errorController;
  String errorMessage = '';
  @override
  void initState() {
    _errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      builder: (context, restoreState) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.verify.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: black, fontSize: 20),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AppIcons.close,
                        width: 24,
                        height: 24,
                        color: manatee,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  LocaleKeys.write_sent_code.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: textSecondary),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0x292B8364),
                            blurRadius: 12,
                            offset: Offset(0, 4))
                      ],
                      color: const Color(0x1F43B7B1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: primary)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Text(
                    widget.isEmail
                        ? widget.phonenumber
                        : widget.phonenumber.isEmpty
                            ? '**************'
                            : '+998 ${widget.phonenumber.replaceRange(6, 11, '******')}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: black),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      LocaleKeys.write_code.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: black),
                    ),
                    if (errorMessage.isNotEmpty) ...[
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          errorMessage,
                          textAlign: TextAlign.right,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: red),
                        ),
                      )
                    ]
                  ],
                ),
                const SizedBox(height: 12),
                PinCodeTextField(
                  onChanged: (value) {
                    errorMessage = '';
                    setState(() {});
                  },
                  controller: pinCodeController,
                  errorAnimationController: _errorController,
                  length: 6,
                  pinTheme: PinTheme(
                      inactiveFillColor: const Color(0xffD9DBD9),
                      selectedColor: primary,
                      selectedFillColor: black,
                      inactiveColor: const Color(0xffD9DBD9),
                      borderRadius: BorderRadius.circular(8),
                      disabledColor: const Color(0xffD9DBD9),
                      activeColor: const Color(0xffD9DBD9),
                      activeFillColor: black,
                      fieldHeight: 50,
                      fieldWidth: 42,
                      shape: PinCodeFieldShape.box),
                  cursorColor: white,
                  keyboardType: TextInputType.number,
                  textStyle: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 18),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 4),
                  appContext: context,
                  showCursor: true,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                BlocBuilder<RestoreBloc, RestoreState>(
                  builder: (context, state) {
                    return RefreshPanel(
                      phone: '+998 ${widget.phonenumber}'.replaceAll(" ", ""),
                      onSuccess: () {
                        context.read<EditProfileBloc>().add(
                              EditProfileEvent.editPhone(
                                phone: '+998 ${widget.phonenumber}'
                                    .replaceAll(" ", ""),
                                onSuccess: () async {},
                                onError: (error) {
                                  context
                                      .read<ShowPopUpBloc>()
                                      .add(ShowPopUp(message: error));
                                },
                              ),
                            );
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<EditProfileBloc, EditProfileState>(
                  builder: (context, state) {
                    return WButton(
                      padding: EdgeInsets.zero,
                      isDisabled: pinCodeController.text.length != 6,
                      onTap: () {
                        context.read<EditProfileBloc>().add(
                              EditProfileEvent.verifyOtpCode(
                                code: pinCodeController.text,
                                signature: state.signature,
                                type: widget.isEmail ? "email" : "phone",
                                phone: widget.isEmail
                                    ? null
                                    : '+998${widget.phonenumber}'
                                        .replaceAll(" ", ""),
                                email:
                                    widget.isEmail ? widget.phonenumber : null,
                                onSuccess: () {},
                                onError: (error) {
                                  errorMessage = error;
                                  setState(() {});
                                  _errorController.sink
                                      .add(ErrorAnimationType.shake);
                                },
                              ),
                            );
                      },
                      height: 40,
                      borderRadius: 6,
                      text: LocaleKeys.next.tr(),
                      textColor: white,
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
