import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardItem extends StatelessWidget {
  final String cardType;
  final String cardNumber;
  final VoidCallback onTapDelete;

  const CardItem({
    super.key,
    required this.cardType,
    required this.cardNumber,
    required this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            cardType == 'humo'
                ? SvgPicture.asset(AppImages.humo)
                : SvgPicture.asset(AppImages.uzcard),
            const SizedBox(width: 8),
            Text(cardNumber, style: Theme.of(context).textTheme.displayLarge),
            const Spacer(),
            WScaleAnimation(
                onTap: onTapDelete,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SvgPicture.asset(AppIcons.delete),
                ))
          ],
        ),
      );
}
