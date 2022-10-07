import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/features/common/presentation/widgets/w_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/profile/presentation/widgets/language_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatefulWidget {
  final Locale currentLocale;

  const LanguageBottomSheet({required this.currentLocale, Key? key})
      : super(key: key);

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  int currentStatus = 0;

  @override
  void initState() {
    if (widget.currentLocale.languageCode == 'ru') {
      currentStatus = 1;
    } else if (widget.currentLocale.languageCode == 'uz') {
      currentStatus = 3;
    } else if (widget.currentLocale.languageCode == 'fr') {
      currentStatus = 2;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WBottomSheet(
      children: [
        Text(
          LocaleKeys.language_app.tr(),
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 12),
        const WDivider(),
        LanguageItem(
          status: currentStatus,
          language: Language(
            title: LocaleKeys.rus.tr(),
            icon: AppIcons.flagRu,
            status: 1,
          ),
          onTap: () async {
            serviceLocator<DioSettings>().setBaseOptions(lang: 'ru');
            StorageRepository.putString('language', 'ru');
            StorageRepository.putString('device_language', 'ru');
            Navigator.pop(context);
            await context.setLocale(const Locale('ru'));
            setState(() {
              currentStatus = 1;
            });
          },
        ),
        const WDivider(),
        LanguageItem(
          status: currentStatus,
          language: Language(
            title: LocaleKeys.uzb_kr.tr(),
            icon: AppIcons.flagUz,
            status: 2,
          ),
          onTap: () async {
            serviceLocator<DioSettings>().setBaseOptions(lang: 'uzc');
            StorageRepository.putString('language', 'uzc');
            StorageRepository.putString('device_language', 'fr');
            Navigator.pop(context);
            await context.setLocale(const Locale('fr'));
            setState(() {
              currentStatus = 2;
            });
          },
        ),
        const WDivider(),
        LanguageItem(
          status: currentStatus,
          language: Language(
            title: LocaleKeys.uzb.tr(),
            icon: AppIcons.flagUz,
            status: 3,
          ),
          onTap: () async {
            serviceLocator<DioSettings>().setBaseOptions(lang: 'uz');
            StorageRepository.putString('language', 'uz');
            StorageRepository.putString('device_language', 'uz');
            Navigator.pop(context);
            await context.setLocale(const Locale('uz'));
            setState(() {
              currentStatus = 3;
            });
          },
        ),
      ],
    );
  }
}

void showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    useRootNavigator: true,
    builder: (context) => LanguageBottomSheet(
      currentLocale: context.locale,
    ),
  );
}

class Language {
  final String icon;
  final String title;
  final int status;

  Language({required this.icon, required this.title, required this.status});
}
