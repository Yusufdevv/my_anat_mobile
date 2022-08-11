import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/widgets/info_container.dart';
import 'package:anatomica/features/common/presentation/widgets/default_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterFeed extends StatefulWidget {
  final VoidCallback onTap;

  const RegisterFeed({required this.onTap, Key? key}) : super(key: key);

  @override
  State<RegisterFeed> createState() => _RegisterFeedState();
}

class _RegisterFeedState extends State<RegisterFeed> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16 + MediaQuery.of(context).padding.bottom),
      child: Column(
        children: [
          DefaultTextField(
            title: 'Имя',
            controller: TextEditingController(),
            onChanged: (value) {},
            prefix: Padding(
              padding: const EdgeInsets.only(left: 12, right: 8),
              child: SvgPicture.asset(AppIcons.user),
            ),
            hintText: 'Введите полное имя',
          ),
          const SizedBox(height: 16),
          DefaultTextField(
            title: 'Логин',
            controller: TextEditingController(),
            onChanged: (value) {},
            prefix: Padding(
              padding: const EdgeInsets.only(left: 12, right: 8),
              child: SvgPicture.asset(AppIcons.user),
            ),
            hintText: 'Придумайте логин',
          ),
          const Spacer(),
          const InfoContainer(),
          WButton(
            text: 'Продолжить',
            onTap: widget.onTap,
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Уже есть аккаунт?',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(),
              ),
              const SizedBox(width: 4),
              WScaleAnimation(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Войти',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
