import 'dart:async';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RestorePinCode extends StatelessWidget {
  final TextEditingController? textEditingController;
  final StreamController<ErrorAnimationType>? errorAnimationController;

  const RestorePinCode(
      {this.textEditingController, this.errorAnimationController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        child: PinCodeTextField(
          onChanged: (value) {},
          controller: textEditingController,
          errorAnimationController: errorAnimationController,
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
          textStyle:
              Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 18),
          hintStyle:
              Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 4),
          appContext: context,
          showCursor: true,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      );
}
