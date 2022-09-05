import 'package:anatomica/features/hospital_single/domain/usecases/get_vacancies.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/vacancies/hospital_vacancies_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_vacancy_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalVacancies extends StatefulWidget {
  const HospitalVacancies({Key? key}) : super(key: key);

  @override
  State<HospitalVacancies> createState() => _HospitalVacanciesState();
}

class _HospitalVacanciesState extends State<HospitalVacancies> {


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HospitalVacanciesBloc, HospitalVacanciesState>(
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.all(16)
              .copyWith(bottom: 16 + MediaQuery.of(context).padding.bottom),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: state.vacancies.length,
          itemBuilder: (context, index) =>  HospitalVacancyItem(entity: state.vacancies[index],),
        );
      },
    );
  }
}
