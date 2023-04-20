import 'dart:developer';

import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/features/common/presentation/widgets/w_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/navigation/presentation/home.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/profile/presentation/widgets/language_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatefulWidget {
  final Locale currentLocale;

  const LanguageBottomSheet({required this.currentLocale, Key? key}) : super(key: key);

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
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
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
            setState(() {
              currentStatus = 1;
            });
            await setLanguage(locale: 'ru', context: context).then((value) {
              // Navigator.pop(context);
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
            setState(() {
              currentStatus = 3;
            });
            await setLanguage(locale: 'uz', context: context).then((value) {
              // Navigator.pop(context);
            });
          },
        ),
      ],
    );
  }

  Future<void> setLanguage({required String locale, required BuildContext context}) async {
    await context.setLocale(Locale(locale));

    await StorageRepository.putString(StoreKeys.language, locale);
    await StorageRepository.putString(StoreKeys.deviceLanguage, locale);
    serviceLocator<DioSettings>().setBaseOptions(lang: locale);

    // await resetLocator();
    Navigator.of(context).pushAndRemoveUntil(fade(page: const HomeScreen()), (route) => false);
    log('::::::::::  after reset:   ::::::::::');
  }
}

Future<void> showLanguageBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
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
