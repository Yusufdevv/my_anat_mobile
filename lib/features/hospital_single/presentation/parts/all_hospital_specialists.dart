import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/hospital_specialist/hospital_specialist_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllHospitalSpecialists extends StatelessWidget {
  final HospitalSpecialistBloc hospitalSpecialistBloc;
  final int organizationId;
  const AllHospitalSpecialists(
      {required this.hospitalSpecialistBloc,
      required this.organizationId,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: hospitalSpecialistBloc
        ..add(HospitalSpecialistDoctorsEvent.getSpecialistsDoctors(
            organizationId: organizationId)),
      child: BlocBuilder<HospitalSpecialistBloc, HospitalSpecialistState>(
        builder: (context, state) {
          return Paginator(
            paginatorStatus:
                MyFunctions.formzStatusToPaginatorStatus(state.status),
            errorWidget: const Text('error'),
            fetchMoreFunction: () {
              hospitalSpecialistBloc.add(
                  HospitalSpecialistDoctorsEvent.getMoreSpecialistsDoctors());
            },
            hasMoreToFetch: state.fetchMore,
            itemBuilder: (context, index) {
              return SizedBox(
                width: MediaQuery.of(context).size.shortestSide - 58,
                child: DoctorItem(
                  showShadow: false,
                  showPosition: true,
                  entity: state.specialists[index],
                  isLocationVisible: false,
                ),
              );
            },
            padding: const EdgeInsets.all(16)
                .copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: state.specialists.length,
          );
        },
      ),
    );
  }
}
