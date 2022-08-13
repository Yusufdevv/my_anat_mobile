import 'package:anatomica/features/map/presentation/widgets/hospital_item.dart';
import 'package:flutter/material.dart';

class ResultList extends StatelessWidget {
  const ResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) => const HospitalItem(),
      padding: const EdgeInsets.all(16).copyWith(bottom: 266),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
    );
  }
}
