import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/checkbox_title.dart';
import 'package:flutter/material.dart';

class SalaryBottomSheet extends StatelessWidget {
  SalaryBottomSheet({Key? key}) : super(key: key);
  final List<String> list = [
    'Не имеет значение',
    'До 3 000 000',
    '3 000 000 - 6 500 000',
    '6 500 000 '
        '- 9 900 000',
    'Свыше 9 900 000'
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ScrolledBottomSheet(
      title: 'Зарплата',
      hasHeader: true,
      children: [
        const WDivider(),
        const SizedBox(height: 16),
        ...List.generate(
          5,
          (index) => CheckBoxTitle(
            title: list[index],
            isLast: index == 4 ? true : false,
          ),
        ),
        WButton(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          text: 'Сохранить',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        SizedBox(height: 4 + mediaQuery.padding.bottom)
      ],
    );
  }
}

void showSalaryBottomSheet(BuildContext context) {
  showModalBottomSheet(
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (context) => SalaryBottomSheet(),
  );
}
