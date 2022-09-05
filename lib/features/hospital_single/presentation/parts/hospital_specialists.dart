import 'package:anatomica/features/hospital_single/domain/usecases/get_specialists.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/hospital_single/hospital_single_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/hospital_specialist/hospital_specialist_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/doctor_list/doctor_list_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalSpecialists extends StatefulWidget {
  const HospitalSpecialists({Key? key}) : super(key: key);

  @override
  State<HospitalSpecialists> createState() => _HospitalSpecialistsState();
}

class _HospitalSpecialistsState extends State<HospitalSpecialists> {


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HospitalSpecialistBloc, HospitalSpecialistState>(
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.all(16)
              .copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
          itemBuilder: (context, index) => DoctorItem(
            entity: state.specialists[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: state.specialists.length,
        );
      },
    );
  }
}
