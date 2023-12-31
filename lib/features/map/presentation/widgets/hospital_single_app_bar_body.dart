import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class HospitalSingleAppBarBody extends StatelessWidget {
  final String shareValue;
  final VoidCallback? onPop;
  const HospitalSingleAppBarBody({
    this.shareValue = '',
    this.onPop,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WScaleAnimation(
          onTap: onPop ?? () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              AppIcons.chevronRight,
              color: textSecondary,
            ),
          ),
        ),
        SvgPicture.asset(AppIcons.mainLogo, height: 20),
        if (shareValue.isNotEmpty) ...{
          WScaleAnimation(
            onTap: () async {
              await Share.share(shareValue);
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                AppIcons.share,
                color: darkGreen,
              ),
            ),
          ),
        } else ...{
          const SizedBox(width: 56)
        }
      ],
    );
  }
}
