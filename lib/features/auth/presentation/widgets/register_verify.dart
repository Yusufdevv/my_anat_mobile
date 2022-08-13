import 'dart:async';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RegisterVerify extends StatefulWidget {
  final VoidCallback onTap;

  const RegisterVerify({required this.onTap, Key? key}) : super(key: key);

  @override
  State<RegisterVerify> createState() => _RegisterVerifyState();
}

class _RegisterVerifyState extends State<RegisterVerify> {
  late TextEditingController pinCodeController;

  @override
  initState() {
    pinCodeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16 + MediaQuery.of(context).padding.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              WScaleAnimation(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 6, 10, 8),
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primary.withOpacity(0.12),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                        color: chipShadowColor.withOpacity(0.19),
                      ),
                    ],
                    border: Border.all(width: 1, color: primary),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '+998 (99) 973-72-60',
                        style: Theme.of(context).textTheme.headline1!.copyWith(),
                      ),
                      const SizedBox(width: 8),
                      WScaleAnimation(
                        onTap: () {},
                        child: SvgPicture.asset(AppIcons.edit),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          PinCodeBody(pinCodeController: pinCodeController),
          const Spacer(),
          WButton(
            text: 'Подтвердить',
            onTap: widget.onTap,
          )
        ],
      ),
    );
  }
}

class PinCodeBody extends StatefulWidget {
  const PinCodeBody({
    Key? key,
    required this.pinCodeController,
  }) : super(key: key);

  final TextEditingController pinCodeController;

  @override
  State<PinCodeBody> createState() => _PinCodeBodyState();
}

class _PinCodeBodyState extends State<PinCodeBody> {
  String _printDuration(int secondsLeft) {
    final minutes = (secondsLeft / 60).floor();
    final seconds = secondsLeft % 60;
    return '0$minutes:${seconds >= 10 ? seconds : '0$seconds'}';
  }

  late Timer _timer;
  int secondsLeft = 120;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft > 0 && mounted) {
        setState(() {
          secondsLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Введите код',
          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        PinCodeTextField(
          keyboardType: TextInputType.number,
          controller: widget.pinCodeController,
          appContext: context,
          errorTextMargin: EdgeInsets.zero,
          cursorHeight: 22,
          autoDismissKeyboard: true,
          autoDisposeControllers: false,
          autoFocus: true,
          textStyle: Theme.of(context).textTheme.headline3!.copyWith(color: textColor, fontSize: 26),
          length: 6,
          animationType: AnimationType.scale,
          showCursor: true,
          pinTheme: PinTheme(
            inactiveFillColor: textFieldColor,
            activeFillColor: textFieldColor,
            inactiveColor: textFieldColor,
            activeColor: primary,
            selectedColor: textFieldColor,
            errorBorderColor: Theme.of(context).colorScheme.error,
            borderWidth: 1,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10),
            selectedFillColor: textFieldColor,
            fieldHeight: 56,
            fieldWidth: 47,
            fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          ),
          animationDuration: const Duration(milliseconds: 200),
          enableActiveFill: true,
          onChanged: (text) {},
          scrollPadding: EdgeInsets.zero,
          beforeTextPaste: (text) => true,
        ),
        if (secondsLeft > 0) ...{
          Row(
            children: [
              Text('Отправить снова:', style: Theme.of(context).textTheme.headline3),
              const SizedBox(width: 6),
              Text(
                _printDuration(secondsLeft),
                style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
              ),
            ],
          ),
        } else ...{
          WScaleAnimation(
            onTap: () {
              if (_timer.isActive) {
                _timer.cancel();
              }
              _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                if (secondsLeft > 0) {
                  setState(() {
                    secondsLeft--;
                  });
                } else {
                  timer.cancel();
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 16),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.refresh),
                  const SizedBox(width: 4),
                  Text('Отправить снова', style: Theme.of(context).textTheme.headline3!.copyWith(color: primary))
                ],
              ),
            ),
          )
        }
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
