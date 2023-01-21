import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/journal_menu_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class JournalMenu extends StatelessWidget {
  final VoidCallback onContentTap;
  final VoidCallback onPreviewTap;
  final VoidCallback onSettingsTap;
  const JournalMenu({
    required this.onContentTap,
    required this.onPreviewTap,
    required this.onSettingsTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: darkerGreen.withOpacity(0.05),
            offset: const Offset(0, 8),
            blurRadius: 32,
          ),
        ],
        color: white,
        border: Border.all(color: textFieldColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JournalMenuItem(
            onTap: onContentTap,
            icon: AppIcons.tableOfContents,
            title: LocaleKeys.content.tr(),
          ),
          const Divider(height: 0, thickness: 1, color: textFieldColor),
          JournalMenuItem(
            onTap: onPreviewTap,
            icon: AppIcons.journalPreview,
            title: LocaleKeys.preview.tr(),
          ),
          const Divider(height: 0, thickness: 1, color: textFieldColor),
          JournalMenuItem(
            onTap: onSettingsTap,
            icon: AppIcons.journalSettings,
            title: LocaleKeys.settings.tr(),
          ),
        ],
      ),
    );
  }
}
