import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/profile/prezentation/widgets/language_item.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  int currentStatus = 0;

  @override
  Widget build(BuildContext context) {
    return WBottomSheet(
      children: [
        Text(
          'Язык приложения',
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
            title: 'Русский',
            icon: AppIcons.flagRu,
            status: 1,
          ),
          onTap: () {
            setState(() {
              currentStatus = 1;
            });
          },
        ),
        const WDivider(),
        LanguageItem(
          status: currentStatus,
          language: Language(
            title: 'Ўзбекча',
            icon: AppIcons.flagUz,
            status: 2,
          ),
          onTap: () {
            setState(() {
              currentStatus = 2;
            });
          },
        ),
        const WDivider(),
        LanguageItem(
          status: currentStatus,
          language: Language(
            title: 'O‘zbekcha',
            icon: AppIcons.flagUz,
            status: 3,
          ),
          onTap: () {
            setState(() {
              currentStatus = 3;
            });
          },
        ),
        const SizedBox(height: 24),
        WButton(
          text: 'Применить',
          onTap: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}

void showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    useRootNavigator: true,
    builder: (context) => const LanguageBottomSheet(),
  );
}

class Language {
  final String icon;
  final String title;
  final int status;

  Language({required this.icon, required this.title, required this.status});
}
