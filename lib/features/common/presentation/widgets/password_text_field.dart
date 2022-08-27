import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/default_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/stroke_paint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordTextField extends StatefulWidget {
  final String prefixIcon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool hasError;

  const PasswordTextField(
      {required this.controller,
      required this.onChanged,
      this.hintText = '',
      this.title = '',
      this.hasError = false,
      this.prefixIcon = AppIcons.key,
      Key? key})
      : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> with TickerProviderStateMixin {
  bool isObscure = true;
  late AnimationController animationController;
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      title: widget.title,
      controller: widget.controller,
      onChanged: widget.onChanged,
      isObscure: isObscure,
      hasError: widget.hasError,
      hintText: widget.hintText,
      maxLines: 1,
      suffix: GestureDetector(
        onTap: () {
          setState(() {
            isObscure = !isObscure;
          });
          if (isObscure) {
            animationController.forward();
          } else {
            animationController.reverse();
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(AppIcons.eye),
            ),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => SizedBox(
                width: 24,
                height: 24,
                child: CustomPaint(
                  foregroundPainter: StrokePaint(animationController.value),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
      prefix: Padding(
        padding: const EdgeInsets.only(left: 12, right: 8),
        child: SvgPicture.asset(widget.prefixIcon),
      ),
    );
  }
}
