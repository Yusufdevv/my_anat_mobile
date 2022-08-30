import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/checkbox_title.dart';
import 'package:flutter/material.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class SalaryBottomSheet extends StatefulWidget {
  const SalaryBottomSheet({Key? key}) : super(key: key);

  @override
  State<SalaryBottomSheet> createState() => _SalaryBottomSheetState();
}

class _SalaryBottomSheetState extends State<SalaryBottomSheet> {
  final List<String> list = [
    'Не имеет значение',
    'До 3 000 000',
    '3 000 000 - 6 500 000',
    '6 500 000 - 9 900 000',
    'Свыше 9 900 000',
  ];
  final List<bool> checkList = [false, false, false, false, false];
  bool isChecked = false;

  selectSalary(int index) {
    setState(() {
      checkList[index] = !checkList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrolledBottomSheet(
      title: LocaleKeys.salary.tr(),
      hasHeader: true,
      children: [
        const WDivider(),
        const SizedBox(height: 16),
        ...List.generate(
          5,
          (index) => CheckBoxTitle(
            onTap: () {
              print('tap');
              selectSalary(index);
            },
            title: list[index],
            isLast: index == 4 ? true : false,
            isChecked: checkList[index],
          ),
        ),
        WButton(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          text: LocaleKeys.save.tr(),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        //    SizedBox(height: 4 + mediaQuery.padding.bottom)
      ],
    );
  }
}

void showSalaryBottomSheet(BuildContext context) {
  showModalBottomSheet(
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => const SalaryBottomSheet(),
  );
}
