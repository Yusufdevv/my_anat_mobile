import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/pages/login.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyDialog extends StatelessWidget {
  const BuyDialog({Key? key}) : super(key: key);

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
            'Покупка журнала',
            style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          WScaleAnimation(
              child: SvgPicture.asset(AppIcons.close),
              onTap: () {
                Navigator.of(context).pop();
              })
        ],
      ),
      content: Text(
        'Зарегистрируйтесь, чтобы в полной мере использовать возможности приложения',
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
                'Регистрация',
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
            // Navigator.push(
            //   context,
            //   fade(
            //     page: const OneTimePayment(),
            //   ),
            // );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.cashBanknote),
              const SizedBox(width: 8),
              Text(
                'Единовременный платеж',
                style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
