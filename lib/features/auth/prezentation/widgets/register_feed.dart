import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/auth/prezentation/widgets/info_container.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';

class RegisterFeed extends StatefulWidget {
  final VoidCallback onTap;

  const RegisterFeed({required this.onTap, Key? key}) : super(key: key);

  @override
  State<RegisterFeed> createState() => _RegisterFeedState();
}

class _RegisterFeedState extends State<RegisterFeed> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
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
      ),
    );
  }
}
