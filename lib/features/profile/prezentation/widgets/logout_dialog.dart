import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogOutDialog extends StatelessWidget {
  final double? height;
  final String? title;
  final String? subTitle;

  const LogOutDialog({this.title, this.subTitle, this.height, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      height: height ?? 174,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title ?? 'Выйти из аккаунта',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Spacer(),
              WScaleAnimation(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(AppIcons.cancelX, color: manatee, height: 20, width: 20)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            subTitle ?? 'Вы действительно хотите выйти из аккаунта?',
            style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: WButton(
                  color: conch.withOpacity(0.2),
                  height: 40,
                  text: 'Нет',
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
                  text: 'Да',
                  height: 40,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

void showLogOutDialog(BuildContext context, {double? height, String? title, String? subTitle}) {
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
          return LogOutDialog(height: height, subTitle: subTitle, title: title);
        },
      ),
    ),
  );
}
