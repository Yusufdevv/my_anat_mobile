import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDialog extends StatelessWidget {
  final double? height;
  final String? title;
  final String? subTitle;
  final VoidCallback onConfirmTap;

  const CustomDialog(
      {this.title,
      this.subTitle,
      this.height,
      required this.onConfirmTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                title ?? LocaleKeys.sing_out.tr(),
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Spacer(),
              WScaleAnimation(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(AppIcons.cancelX,
                      color: manatee, height: 20, width: 20)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            subTitle ?? LocaleKeys.you_sure.tr(),
            style:
                Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: WButton(
                  color: conch.withOpacity(0.2),
                  height: 40,
                  text: LocaleKeys.no.tr(),
                  textColor: textSecondary,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: WButton(
                    color: red,
                    text: LocaleKeys.yes.tr(),
                    height: 40,
                    onTap: onConfirmTap),
              ),
            ],
          )
        ],
      ),
    );
  }
}

void showCustomDialog(BuildContext context,
    {required VoidCallback onConfirmTap, String? title, String? subTitle}) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      actionsPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      content: Builder(
        builder: (context) {
          return CustomDialog(
            subTitle: subTitle,
            title: title,
            onConfirmTap: onConfirmTap,
          );
        },
      ),
    ),
  );
}
