import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/profile/prezentation/pages/change_password.dart';
import 'package:anatomica/features/profile/prezentation/widgets/logout_dialog.dart';
import 'package:anatomica/features/profile/prezentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class SafetyScreen extends StatelessWidget {
  const SafetyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: WAppBar(
        title: LocaleKeys.safety.tr(),
        hasUnderline: true,
      ),
      body: Padding(
        padding:
            EdgeInsets.fromLTRB(16, 20, 16, 20 + mediaQuery.padding.bottom),
        child: Column(
          children: [
            ProfileItem(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .push(fade(page: const ChangePasswordScreen()));
              },
              title: LocaleKeys.edit_password_acc.tr(),
              icon: AppIcons.key,
              iconColor: primary,
            ),
            const SizedBox(height: 12),
            ProfileItem(
              onTap: () {
                showLogOutDialog(
                  context,
                  height: 225,
                  title: LocaleKeys.delete_acc.tr(),
                  subTitle: LocaleKeys.info_about_delete_acc.tr(),
                );
              },
              title: LocaleKeys.delete_account.tr(),
              icon: AppIcons.trash,
              color: snow,
            ),
          ],
        ),
      ),
    );
  }
}
