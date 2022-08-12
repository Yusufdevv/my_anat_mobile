import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/vacancy_single.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item.dart';
import 'package:flutter/material.dart';

class VacancyItemList extends StatelessWidget {
  final EdgeInsets? margin;

  const VacancyItemList({this.margin, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => VacancyItem(
        margin: margin,
        onTap: () {
          Navigator.of(context).push(fade(page: const VacancySingleScreen()));
        },
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: 10,
    );
  }
}
