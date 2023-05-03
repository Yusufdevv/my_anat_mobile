import 'dart:async';
import 'dart:developer';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeBody extends StatefulWidget {
  const PinCodeBody({
    Key? key,
    required this.pinCodeController,
    this.hasError = false,
    this.errorText = '',
    this.secondsLeft,
    required this.onRefresh,
    required this.onTimeChanged,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController pinCodeController;
  final bool hasError;
  final String errorText;
  final VoidCallback onRefresh;
  final ValueChanged<int> onTimeChanged;
  final int? secondsLeft;
  final ValueChanged<String> onChanged;

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
    if (widget.secondsLeft != null && widget.secondsLeft! >= 10) {
      secondsLeft = widget.secondsLeft!;
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft > 0 && mounted) {
        setState(() {
          secondsLeft--;
        });
        widget.onTimeChanged(secondsLeft);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('hasError => ${widget.hasError}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              LocaleKeys.write_code.tr(),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            if (widget.hasError) ...[
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  widget.errorText,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: red),
                ),
              )
            ],
          ],
        ),
        const SizedBox(height: 12),
        PinCodeTextField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.number,
          controller: widget.pinCodeController,
          appContext: context,
          errorTextMargin: EdgeInsets.zero,
          cursorHeight: 22,
          autoDismissKeyboard: true,
          autoDisposeControllers: false,
          autoFocus: true,
          textStyle: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: textColor, fontSize: 26),
          length: 6,
          animationType: AnimationType.scale,
          showCursor: true,
          pinTheme: PinTheme(
            inactiveFillColor: textFieldColor,
            activeFillColor: textFieldColor,
            inactiveColor: textFieldColor,
            activeColor: widget.hasError ? Colors.red : primary,
            selectedColor: textFieldColor,
            errorBorderColor: Colors.red,
            borderWidth: 1,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10),
            selectedFillColor: textFieldColor,
            fieldHeight: 56,
            fieldWidth: 47,
            fieldOuterPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          ),
          animationDuration: const Duration(milliseconds: 200),
          enableActiveFill: true,
          onChanged: widget.onChanged,
          scrollPadding: EdgeInsets.zero,
          beforeTextPaste: (text) => true,
          validator: (v) {
            if (widget.hasError) {
              return '';
            }
            return null;
          },
        ),
        if (secondsLeft > 0) ...{
          Row(
            children: [
              Text(LocaleKeys.again.tr(),
                  style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(width: 6),
              Text(
                _printDuration(secondsLeft),
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: textColor),
              ),
            ],
          ),
        } else ...{
          WScaleAnimation(
            onTap: () {
              if (_timer.isActive) {
                _timer.cancel();
              }
              setState(() {
                secondsLeft = 120;
              });
              _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                if (secondsLeft > 0) {
                  setState(() {
                    secondsLeft--;
                  });
                  widget.onTimeChanged(secondsLeft);
                } else {
                  timer.cancel();
                }
              });
              widget.onRefresh();
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 16),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.refresh),
                  const SizedBox(width: 4),
                  Text(LocaleKeys.send_again.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: primary))
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
