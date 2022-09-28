import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/empty_page.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/map/presentation/blocs/hospital_list_bloc/hospital_list_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultList extends StatelessWidget {
  const ResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HospitalListBloc, HospitalListState>(
      builder: (context, state) {
        return Paginator(
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            padding: const EdgeInsets.all(16).copyWith(bottom: 266),
            emptyWidget: const EmptyPage(
              title: 'Ничего не найдено',
              desc: 'Результаты не найдены по вашему запросу',
              iconPath: AppIcons.emptyA,
            ),
            paginatorStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            itemBuilder: (c, index) {
              return HospitalItem(
                entity: state.hospitals[index],
              );
            },
            itemCount: state.hospitals.length,
            fetchMoreFunction: () {
              context.read<HospitalListBloc>().add(HospitalListEvent.getMoreHospitals());
            },
            hasMoreToFetch: state.totalCount > state.hospitals.length,
            errorWidget: const SizedBox());
      },
    );
  }
}
