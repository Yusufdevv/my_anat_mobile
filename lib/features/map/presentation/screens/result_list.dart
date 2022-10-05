import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/empty_page.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/map/presentation/blocs/hospital_list_bloc/hospital_list_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultList extends StatelessWidget {
  const ResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HospitalListBloc, HospitalListState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topCenter,
          child: RefreshIndicator(
            onRefresh: () async {
              context
                  .read<HospitalListBloc>()
                  .add(HospitalListEvent.getHospitals(search: ''));

              return await Future.delayed(const Duration(seconds: 1));
            },
            child: Paginator(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                padding: const EdgeInsets.all(16).copyWith(
                    bottom: MediaQuery.of(context).padding.bottom + 136),
                emptyWidget: Center(
                  child: SingleChildScrollView(
                    child: EmptyPage(
                      title: LocaleKeys.nothing.tr(),
                      desc: LocaleKeys.result_not_found.tr(),
                      iconPath: AppIcons.emptyA,
                    ),
                  ),
                ),
                paginatorStatus:
                    MyFunctions.formzStatusToPaginatorStatus(state.status),
                itemBuilder: (c, index) {
                  return HospitalItem(
                    entity: state.hospitals[index],
                  );
                },
                itemCount: state.hospitals.length,
                fetchMoreFunction: () {
                  context
                      .read<HospitalListBloc>()
                      .add(HospitalListEvent.getMoreHospitals());
                },
                hasMoreToFetch: state.totalCount > state.hospitals.length,
                errorWidget: const SizedBox()),
          ),
        );
      },
    );
  }
}
