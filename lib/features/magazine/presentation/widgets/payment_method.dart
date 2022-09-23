import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  final ValueChanged<String> onTap;
  final String paymentMethod;
  final String currentPaymentMethod;
  final String icon;
  final double iconHeight;
  const PaymentMethod({
    required this.onTap,
    required this.currentPaymentMethod,
    required this.paymentMethod,
    required this.icon,
    required this.iconHeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () => onTap(paymentMethod),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: lilyWhite,
          border: Border.all(color: paymentMethod == currentPaymentMethod ? primary : lilyWhite),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(icon, height: iconHeight),
      ),
    );
  }
}
