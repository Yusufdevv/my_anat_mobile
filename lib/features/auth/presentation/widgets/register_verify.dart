import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/widgets/pin_code_body.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
