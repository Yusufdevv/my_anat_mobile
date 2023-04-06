import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethod extends StatelessWidget {
  final ValueChanged<String> onTap;
  final String paymentMethod;
  final String currentPaymentMethod;
  final String icon;
  final double? iconHeight;
  final Widget? title;
  final EdgeInsets? margin;
  const PaymentMethod({
    required this.onTap,
    required this.currentPaymentMethod,
    required this.paymentMethod,
    this.icon = '',
    this.iconHeight,
    this.title,
    this.margin,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () => onTap(paymentMethod),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: margin,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: paymentMethod == currentPaymentMethod ? white : lilyWhite,
          border: Border.all(
              color:
                  paymentMethod == currentPaymentMethod ? primary : lilyWhite),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: paymentMethod == currentPaymentMethod
                  ? SvgPicture.asset(AppIcons.paymentMethodCheck)
                  : Container(
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(
                          color: checkUnselected, shape: BoxShape.circle),
                    ),
            ),
            const SizedBox(width: 6),
            title ??
                SvgPicture.asset(
                  icon,
                  height: iconHeight,
                  fit: BoxFit.cover,
                ),
          ],
        ),
      ),
    );
  }
}
