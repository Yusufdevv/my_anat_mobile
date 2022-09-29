import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/empty_page.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
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
        return Paginator(
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 136),
            emptyWidget: const Center(
              child: SingleChildScrollView(
                child: EmptyPage(
                  title: 'Ничего не найдено',
                  desc: 'Результаты не найдены по вашему запросу',
                  iconPath: AppIcons.emptyA,
                ),
              ),
            ),
            paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(state.status),
            itemBuilder: (c, index) {
              return DoctorItem(
                entity: state.doctors[index],
              );
            },
            itemCount: state.doctors.length,
            fetchMoreFunction: () {
              context.read<DoctorListBloc>().add(DoctorListEvent.getMoreDoctors());
            },
            hasMoreToFetch: state.count > state.doctors.length,
            errorWidget: const SizedBox());
      },
    );
  }
}
