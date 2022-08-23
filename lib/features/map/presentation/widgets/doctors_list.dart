import 'package:anatomica/features/map/presentation/widgets/doctor_item.dart';
import 'package:flutter/material.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) => const DoctorItem(),
      padding: const EdgeInsets.all(16).copyWith(bottom: 266),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
    );
  }
}
