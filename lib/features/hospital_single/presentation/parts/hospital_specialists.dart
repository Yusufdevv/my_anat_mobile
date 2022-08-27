import 'package:anatomica/features/map/presentation/blocs/doctor_list/doctor_list_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalSpecialists extends StatelessWidget {
  const HospitalSpecialists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorListBloc, DoctorListState>(
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery
              .of(context)
              .padding
              .bottom + 16),
          itemBuilder: (context, index) => DoctorItem(entity: state.doctors[index],),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: state.doctors.length,
        );
      },
    );
  }
}
