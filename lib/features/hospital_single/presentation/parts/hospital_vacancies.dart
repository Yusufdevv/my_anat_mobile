import 'package:anatomica/features/map/presentation/widgets/hospital_vacancy_item.dart';
import 'package:flutter/material.dart';

class HospitalVacancies extends StatelessWidget {
  const HospitalVacancies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16).copyWith(bottom: 16 + MediaQuery.of(context).padding.bottom),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: 10,
      itemBuilder: (context, index) => const HospitalVacancyItem(),
    );
  }
}
