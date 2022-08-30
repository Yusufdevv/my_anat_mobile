import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/profile/prezentation/widgets/language_bottomsheet.dart';
import 'package:anatomica/features/profile/prezentation/widgets/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(title: LocaleKeys.setting.tr(), hasUnderline: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SettingItem(
              title: LocaleKeys.language_app.tr(),
              icon: AppIcons.flagRu,
              onTap: () {
                showLanguageBottomSheet(context);
              },
            ),
            const SizedBox(height: 12),
            const WDivider(),
            // const SizedBox(height: 12),
            // SettingItem(
            //   title: LocaleKeys.active_device.tr(),
            //   onTap: () {
            //     Navigator.of(context).push(fade(page: ActiveDevicesScreen()));
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
