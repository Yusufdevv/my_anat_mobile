import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/profile/presentation/widgets/language_bottomsheet.dart';
import 'package:anatomica/features/profile/presentation/widgets/setting_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

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
              icon: context.locale.languageCode == 'ru' ? AppIcons.flagRu : AppIcons.flagUz,
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
