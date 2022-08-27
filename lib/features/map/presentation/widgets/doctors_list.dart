import 'package:anatomica/features/map/presentation/blocs/doctor_list/doctor_list_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsList extends StatefulWidget {
  const DoctorsList({Key? key}) : super(key: key);

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorListBloc, DoctorListState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.doctors.length,
          itemBuilder: (context, index) => DoctorItem(
            entity: state.doctors[index],
          ),
          padding: const EdgeInsets.all(16).copyWith(bottom: 266),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
        );
      },
    );
  }
}
