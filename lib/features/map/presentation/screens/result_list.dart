import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/empty_page.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/map/domain/entities/org_map_v2_entity.dart';
import 'package:anatomica/features/map/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class OrganizationList extends StatelessWidget {
  final Point myPoint;

  const OrganizationList({required this.myPoint, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapOrganizationBloc, MapOrganizationState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topCenter,
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<MapOrganizationBloc>().add(MapGetHospitalsWithDistance(
                    search: '',
                    myPoint: myPoint,
                  ));

              return await Future.delayed(const Duration(seconds: 1));
            },
            child: Paginator(
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).viewInsets.bottom + 136),
                emptyWidget: Center(
                  child: SingleChildScrollView(
                    child: EmptyPage(
                      title: LocaleKeys.nothing.tr(),
                      desc: LocaleKeys.result_not_found.tr(),
                      iconPath: AppIcons.emptyA,
                    ),
                  ),
                ),
                paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(state.status),
                itemBuilder: (c, index) {
                  return HospitalItem(
                    wrapItems: state.hospitals[index].getServiceOrSpecialization,
                    entity: state.hospitals[index],
                  );
                },
                itemCount: state.hospitals.length,
                fetchMoreFunction: () {
                  context.read<MapOrganizationBloc>().add(MapGetMoreHospitalsWithDistanceEvent());
                },
                hasMoreToFetch: state.fetchMore,
                errorWidget: const SizedBox()),
          ),
        );
      },
    );
  }
}
