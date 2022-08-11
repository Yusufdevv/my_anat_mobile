import 'package:anatomica/features/vacancy/prezentation/widgets/licence_item.dart';
import 'package:flutter/material.dart';

class LicenceItemList extends StatelessWidget {
  const LicenceItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const LicenceItem(),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: 1,
    );
  }
}
