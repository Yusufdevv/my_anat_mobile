import 'dart:developer';

import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/empty_page.dart';
import 'package:anatomica/features/map/domain/entities/org_map_v2_entity.dart';
import 'package:anatomica/features/map/domain/entities/service_or_specialization_entity.dart';
import 'package:anatomica/features/map/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/doctors_list.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SuggestionListScreen extends StatelessWidget {
  final Function(String) onTapItem;
  final String searchText;
  final Point myPoint;
  final bool isDoctor;

  const SuggestionListScreen(
      {required this.onTapItem, required this.isDoctor, required this.searchText, required this.myPoint, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(':::::::::: is Doctor:  ${isDoctor}  ::::::::::');
    return isDoctor
        ? DoctorsList(
            textEditingController: TextEditingController(text: searchText),
            myPoint: myPoint,
          )
        : BlocBuilder<MapOrganizationBloc, MapOrganizationState>(
            builder: (context, state) {
              if (state.hospitalsWithDistance.isEmpty) {
                return Center(
                  child: SingleChildScrollView(
                    child: EmptyPage(
                      title: LocaleKeys.nothing.tr(),
                      desc: LocaleKeys.result_not_found.tr(),
                      iconPath: AppIcons.emptyA,
                    ),
                  ),
                );
              }
              return Container(
                color: Colors.indigo,
                alignment: Alignment.topCenter,
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, MediaQuery.of(context).viewInsets.bottom + 196),
                  separatorBuilder: (context, index) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    List<ServiceOrSpecializationEntity> wrapItems = [];
                    if (searchText.isNotEmpty) {
                      wrapItems = state.hospitalsWithDistance[index].getServiceOrSpecialization
                          .where((e) => e.title.toLowerCase().contains(state.searchText.toLowerCase()))
                          .toList();
                    } else {
                      wrapItems = state.hospitalsWithDistance[index].getServiceOrSpecialization;
                    }
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        // onTapItem('');
                      },
                      child: HospitalItem(
                        wrapItems: wrapItems,
                        entity: state.hospitalsWithDistance[index],
                        isSuggestionItem: true,
                        searchText: searchText,
                      ),
                    );
                  },
                  itemCount: state.hospitalsWithDistance.length,
                ),
              );
            },
          );
  }
}
