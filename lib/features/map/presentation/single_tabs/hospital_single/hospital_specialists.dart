import 'package:anatomica/features/map/presentation/widgets/doctor_item.dart';
import 'package:flutter/material.dart';

class HospitalSpecialists extends StatelessWidget {
  const HospitalSpecialists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
      itemBuilder: (context, index) => const DoctorItem(),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: 20,
    );
  }
}
