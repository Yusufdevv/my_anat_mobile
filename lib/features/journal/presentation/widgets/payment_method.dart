import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethod extends StatelessWidget {
  final ValueChanged<String> onTap;
  final String paymentMethod;
  final bool isSelected;
  final String icon;
  final double? iconHeight;
  final Widget? title;
  final EdgeInsets? margin;

  const PaymentMethod({
    required this.onTap,
    required this.isSelected,
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
          color: isSelected ? white : lilyWhite,
          border: Border.all(color: isSelected ? primary : lilyWhite),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: isSelected
                  ? SvgPicture.asset(AppIcons.paymentMethodCheck)
                  : Container(
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(color: checkUnselected, shape: BoxShape.circle),
                    ),
            ),
            SizedBox(width: paymentMethod == 'card' ? 12 : 6),
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
