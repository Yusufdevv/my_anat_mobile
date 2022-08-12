import 'package:anatomica/features/vacancy/prezentation/widgets/filter_card.dart';
import 'package:flutter/material.dart';

class FilterCardList extends StatelessWidget {
  const FilterCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const FilterCard(),
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemCount: 4,
      ),
    );
  }
}
