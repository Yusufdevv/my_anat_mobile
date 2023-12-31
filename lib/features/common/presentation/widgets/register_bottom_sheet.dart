import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/pages/register.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterBottomSheet extends StatelessWidget {
  final BuildContext parentContext;
  const RegisterBottomSheet({
    required this.parentContext,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16)
              .copyWith(
                  bottom: MediaQuery.of(context).padding.bottom + 20, top: 0),
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppIcons.registerUserIcon,
              ),
              Text(
                LocaleKeys.please_register.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              WButton(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(parentContext, rootNavigator: true)
                      .push(fade(page: const RegisterScreen()));
                },
                borderRadius: 8,
                text: LocaleKeys.za_register.tr(),
              )
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: WScaleAnimation(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              height: 28,
              width: 28,
              decoration: const BoxDecoration(
                color: textFieldColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(AppIcons.clearRounded),
            ),
          ),
        )
      ],
    );
  }
}

void showRegisterBottomSheet(BuildContext context) => showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (_) => RegisterBottomSheet(parentContext: context),
    );
