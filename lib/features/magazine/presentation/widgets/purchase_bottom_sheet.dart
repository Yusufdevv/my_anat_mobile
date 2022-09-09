import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PurchaseBottomSheet extends StatelessWidget {
  final int amount;
  final VoidCallback onButtonTap;
  const PurchaseBottomSheet({required this.amount, required this.onButtonTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16)
              .copyWith(bottom: MediaQuery.of(context).padding.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppIcons.diamond,
                height: 48,
                width: 48,
                color: gold,
              ),
              const SizedBox(height: 12),
              Text.rich(
                TextSpan(
                  text: 'Неограниченные возможности\nвсего от ',
                  children: [
                    TextSpan(
                        text: '${MyFunctions.getFormatCostFromInt(amount)} ',
                        style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18)),
                    TextSpan(
                        text: 'в месяц',
                        style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18, color: gold)),
                  ],
                ),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 32),
              WButton(
                onTap: onButtonTap,
                color: gold,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.diamond,
                      color: white,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text('Оформить подписку')
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          child: WScaleAnimation(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: SvgPicture.asset(
                AppIcons.premiumBottomSheetClose,
              ),
            ),
          ),
        )
      ],
    );
  }
}
