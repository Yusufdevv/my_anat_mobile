import 'package:anatomica/features/vacancy/prezentation/widgets/education_item.dart';
import 'package:flutter/material.dart';

class EducationItemList extends StatelessWidget {
  const EducationItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const EducationItem(),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: 2,
    );
  }
}
