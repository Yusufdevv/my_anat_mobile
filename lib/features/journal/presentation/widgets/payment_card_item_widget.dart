import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentCardItem extends StatelessWidget {
  final String? cardType;
  final String? cardNumber;
  final VoidCallback onTap;

  const PaymentCardItem({
    required this.cardType,
    required this.cardNumber,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
      decoration: BoxDecoration(
        color: lilyWhite,
        border: Border.all(color: lilyWhite),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          cardType == 'humo' ? SvgPicture.asset(AppImages.humo) : SvgPicture.asset(AppImages.uzcard),
          const SizedBox(width: 12),
          Expanded(child: Text(cardNumber ?? '', style: Theme.of(context).textTheme.displayLarge)),
          WScaleAnimation(
            onTap: onTap,
            child: Container(
              height: 36,
              width: 36,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(color: textSecondary.withOpacity(.16), borderRadius: BorderRadius.circular(6)),
              child: SvgPicture.asset(AppIcons.chevronsUpDown),
            ),
          ),
        ],
      ),
    );
  }
}
