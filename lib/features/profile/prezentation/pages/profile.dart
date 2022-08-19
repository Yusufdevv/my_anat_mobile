import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/profile/prezentation/pages/favorites.dart';
import 'package:anatomica/features/profile/prezentation/pages/help.dart';
import 'package:anatomica/features/profile/prezentation/pages/safety.dart';
import 'package:anatomica/features/profile/prezentation/pages/setting.dart';
import 'package:anatomica/features/profile/prezentation/widgets/logout_dialog.dart';
import 'package:anatomica/features/profile/prezentation/widgets/other_profile_item.dart';
import 'package:anatomica/features/profile/prezentation/widgets/profile_app_bar.dart';
import 'package:anatomica/features/profile/prezentation/widgets/profile_card.dart';
import 'package:anatomica/features/profile/prezentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: ProfileAppBar(),
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.fromLTRB(16, 16, 16, 20 + mediaQuery.padding.bottom),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const ProfileCard(),
            const SizedBox(height: 16),
            ProfileItem(
                title: 'Кабинет врача', icon: AppIcons.scope, onTap: () {}),
            const SizedBox(height: 12),
            ProfileItem(
                title: 'Настройки',
                icon: AppIcons.setting,
                onTap: () {
                  Navigator.of(context).push(fade(page: const SettingScreen()));
                }),
            const SizedBox(height: 12),
            ProfileItem(
                title: 'Безопасность',
                icon: AppIcons.lock,
                onTap: () {
                  Navigator.of(context).push(fade(page: const SafetyScreen()));
                }),
            const SizedBox(height: 12),
            ProfileItem(
                title: 'Избранные',
                icon: AppIcons.profileStar,
                onTap: () {
                  Navigator.of(context)
                      .push(fade(page: const FavoritesScreen()));
                }),
            const SizedBox(height: 12),
            ProfileItem(
                title: 'Помощь',
                icon: AppIcons.help,
                onTap: () {
                  Navigator.of(context).push(fade(page: const HelpScreen()));
                }),
            const SizedBox(height: 12),
            const WDivider(),
            const SizedBox(height: 12),
            ProfileItem(
                title: 'Выйти из аккаунта',
                icon: AppIcons.logout,
                onTap: () {
                  showLogOutDialog(context);
                },
                color: snow),
            const SizedBox(height: 67),
            const OtherProfileItem(),
            const SizedBox(height: 12),
            const OtherProfileItem(
              iconBackgroundColor: steelBlue,
              icon: AppIcons.icHospital,
              backgroundColor: pattensBlue,
              title: 'Получить профиль организации',
            ),
          ],
        ),
      ),
    );
  }
}
