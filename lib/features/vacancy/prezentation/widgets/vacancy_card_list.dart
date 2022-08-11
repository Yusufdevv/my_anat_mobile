import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_card.dart';
import 'package:flutter/material.dart';

class VacancyCardList extends StatelessWidget {
  final VoidCallback onTap;

  const VacancyCardList({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 131,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => VacancyCard(onTap: onTap),
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemCount: 3,
      ),
    );
  }
}
