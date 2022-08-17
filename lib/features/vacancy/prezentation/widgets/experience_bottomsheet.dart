import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/checkbox_title.dart';
import 'package:flutter/material.dart';

class ExperienceBottomSheet extends StatefulWidget {
  const ExperienceBottomSheet({Key? key}) : super(key: key);

  @override
  State<ExperienceBottomSheet> createState() => _ExperienceBottomSheetState();
}

class _ExperienceBottomSheetState extends State<ExperienceBottomSheet> {
  final List<String> list = [
    'меньше 1 года',
    '1 - 5 лет',
    '5 - 10 лет',
    '10 - 15 лет',
  ];

  final List<bool> checkList = [false, false, false, false];

  void isChecked(int index) {
    setState(() {
      checkList[index] = !checkList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ScrolledBottomSheet(
      title: 'Опыт работы',
      hasHeader: true,
      isSubScreen: true,
      children: [
        const SizedBox(height: 16),
        ...List.generate(
          list.length,
          (index) => CheckBoxTitle(
            isChecked: checkList[index],
            onTap: () {
              isChecked(index);
            },
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
        const SizedBox(height: 4)
      ],
    );
  }
}

void showExperienceBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const ExperienceBottomSheet(),
  );
}
