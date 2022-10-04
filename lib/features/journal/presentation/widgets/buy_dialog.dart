import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/pages/login.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyDialog extends StatelessWidget {
  final VoidCallback onRegistrationTap;
  final VoidCallback onPaymentTap;
  const BuyDialog({required this.onPaymentTap, required this.onRegistrationTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.fromLTRB(26, 12, 16, 20),
      actionsPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: textFieldColor), borderRadius: BorderRadius.all(Radius.circular(12.0))),
      title: Row(
        children: [
          Text(
            LocaleKeys.buy_magazine.tr(),
            style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          WScaleAnimation(
            child: SvgPicture.asset(AppIcons.close),
            onTap: () {
              Navigator.of(context).pop();
              onRegistrationTap();
            },
          )
        ],
      ),
      content: Text(
        LocaleKeys.sing_up_to_full.tr(),
        style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
      ),
      actions: [
        WButton(
          onTap: () {
            Navigator.of(context).push(fade(page: const LoginScreen()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.userPlus),
              const SizedBox(width: 8),
              Text(
                LocaleKeys.register.tr(),
                style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        WButton(
          border: Border.all(color: primary),
          color: unFollowButton,
          margin: const EdgeInsets.only(top: 12),
          onTap: () {
            Navigator.of(context).pop();
            onPaymentTap();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.cashBanknote),
              const SizedBox(width: 8),
              Text(
                LocaleKeys.only_pay.tr(),
                style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
