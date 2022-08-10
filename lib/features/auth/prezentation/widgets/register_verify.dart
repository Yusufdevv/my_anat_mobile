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
  late StreamController<ErrorAnimationType> errorController;

  @override
  initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 6, 10, 8),
              height: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
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
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Введите код',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        PinCodeTextField(
          errorAnimationController: errorController,
          controller: TextEditingController(),
          onCompleted: (value) {
            // TODO: Use this controller when error occures: errorController.add(ErrorAnimationType.shake);
          },
          keyboardType: TextInputType.number,
          appContext: context,
          cursorColor: Theme.of(context).colorScheme.onSurface,
          cursorHeight: 22,
          textInputAction: TextInputAction.next,
          autoDismissKeyboard: true,
          autoDisposeControllers: false,
          autoFocus: true,
          textStyle: Theme.of(context).textTheme.headline3!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
          length: 6,
          animationType: AnimationType.scale,
          showCursor: true,
          pinTheme: PinTheme(
            selectedColor: primary,
            inactiveFillColor: Colors.grey,
            activeFillColor: primary,
            errorBorderColor: Theme.of(context).colorScheme.error,
            borderWidth: 1,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(8),
            selectedFillColor: Colors.grey,
            activeColor: primary,
            inactiveColor: Colors.grey,
            fieldHeight: 56,
            fieldWidth: 49,
            fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 0),
          ),
          animationDuration: const Duration(milliseconds: 200),
          onChanged: (pin) {},
          beforeTextPaste: (text) => false,
        ),
        Row(
          children: [
            Text('Отправить снова:', style: Theme.of(context).textTheme.headline3),
            const SizedBox(width: 6),
          ],
        ),
        const Spacer(),
        WButton(
          text: 'Подтвердить',
          onTap: widget.onTap,
        )
      ],
    );
  }
}
