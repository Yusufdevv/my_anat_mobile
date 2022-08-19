import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/profile/prezentation/pages/active_devices.dart';
import 'package:anatomica/features/profile/prezentation/widgets/language_bottomsheet.dart';
import 'package:anatomica/features/profile/prezentation/widgets/setting_item.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WAppBar(title: 'Настройки', hasUnderline: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SettingItem(
              title: 'Язык приложения',
              icon: AppIcons.flagRu,
              onTap: () {
                showLanguageBottomSheet(context);
              },
            ),
            const SizedBox(height: 12),
            const WDivider(),
            const SizedBox(height: 12),
            SettingItem(
              title: 'Активные устройства',
              onTap: () {
                Navigator.of(context).push(fade(page: ActiveDevicesScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
