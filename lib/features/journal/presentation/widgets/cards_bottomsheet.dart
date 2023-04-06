import 'package:anatomica/features/common/presentation/widgets/w_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:flutter/material.dart';

class CardsBottomSheet extends StatefulWidget {

  const CardsBottomSheet({ Key? key})
      : super(key: key);

  @override
  State<CardsBottomSheet> createState() => _CardsBottomSheetState();
}

class _CardsBottomSheetState extends State<CardsBottomSheet> {
  int currentStatus = 0;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WBottomSheet(
      children: [
        Text(
          'Карты',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        const WDivider(),
        RadioListTile(value: 1, groupValue: 1, onChanged: (val){}, title: Text('Humo'),),
        const WDivider(),
        RadioListTile(value: 2, groupValue: 1, onChanged: (val){}, title: Text('UzCard'),),

      ],
    );
  }
}

// void showLanguageBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     backgroundColor: Colors.transparent,
//     useRootNavigator: true,
//     builder: (context) => LanguageBottomSheet(
//       currentLocale: context.locale,
//     ),
//   );
// }

// LanguageItem(
// status: currentStatus,
// language: Language(
// title: LocaleKeys.uzb.tr(),
// icon: AppIcons.flagUz,
// status: 3,
// ),
// onTap: () async {
// serviceLocator<DioSettings>().setBaseOptions(lang: 'uz');
// StorageRepository.putString('language', 'uz');
// StorageRepository.putString('device_language', 'uz');
// Navigator.pop(context);
// await context.setLocale(const Locale('uz'));
// setState(() {
// currentStatus = 3;
// });
// },
// ),
