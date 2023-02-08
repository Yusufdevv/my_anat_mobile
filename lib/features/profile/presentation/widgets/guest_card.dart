import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/auth/presentation/pages/login.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GuestCard extends StatelessWidget {
  const GuestCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          fade(
            page: const LoginScreen(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: white,
          border: Border.all(width: 1, color: persianIndigo),
          boxShadow: [
            BoxShadow(
              color: darkerGreen.withOpacity(0.09),
              offset: const Offset(0, 8),
              blurRadius: 24,
            )
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              AppImages.guestImage,
              width: 48,
              height: 48,
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.not_registered_account.tr(),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displayLarge,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            SvgPicture.asset(
              AppIcons.arrowRight,
              height: 20,
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
