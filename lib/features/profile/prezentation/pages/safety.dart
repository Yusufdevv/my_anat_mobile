import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/profile/prezentation/pages/change_password.dart';
import 'package:anatomica/features/profile/prezentation/widgets/logout_dialog.dart';
import 'package:anatomica/features/profile/prezentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: const WAppBar(
        title: 'Безопасность',
        hasUnderline: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 20, 16, 20 + mediaQuery.padding.bottom),
        child: Column(
          children: [
            ProfileItem(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .push(fade(page: const ChangePasswordScreen()));
              },
              title: 'Изменить пароль аккаунта',
              icon: AppIcons.key,
              iconColor: primary,
            ),
            const SizedBox(height: 12),
            ProfileItem(
              onTap: () {
                showLogOutDialog(
                  context,
                  height: 225,
                  title: 'Удалить аккаунт?',
                  subTitle: 'После выполнения данного действия, вся информация связанная с вашим '
                      'аккаунтом будет безвозвратно удалена. Восстановление всех ваших данных будет невозможным.',
                );
              },
              title: 'Удалить аккаунт',
              icon: AppIcons.trash,
              color: snow,
            ),
          ],
        ),
      ),
    );
  }
}
