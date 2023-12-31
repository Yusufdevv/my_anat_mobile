import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/data/models/phone_number2_model.dart';
import 'package:anatomica/features/common/presentation/widgets/empty_page.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/map/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/map/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/doctor_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DoctorsList extends StatefulWidget {
  final TextEditingController textEditingController;

  const DoctorsList({required this.textEditingController, Key? key}) : super(key: key);

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapOrganizationBloc, MapOrganizationState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topCenter,
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<MapOrganizationBloc>().add(MapGetDoctorsEvent(context: context));
              return await Future.delayed(const Duration(seconds: 1));
            },
            child: Paginator(
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 136),
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
                  return DoctorItem(
                    showPosition: false,
                    entity: HospitalDoctorsEntity(
                        image: state.doctors[index].image,
                        longitude: state.doctors[index].longitude,
                        latitude: state.doctors[index].latitude,
                        phoneNumber: state.doctors[index].phoneNumbers.isEmpty
                            ? ''
                            : state.doctors[index].phoneNumbers.first.isEmpty
                                ? ''
                                : state.doctors[index].phoneNumbers.first.first,
                        address: state.doctors[index].address,
                        id: state.doctors[index].id,
                        distance: state.doctors[index].distance,
                        doctorName: state.doctors[index].doctorName,
                        fullName: state.doctors[index].fullName,
                        imgIsFull: state.doctors[index].imgIsFull,
                        isFavourite: false,
                        organizationName: state.doctors[index].organizationName,
                        phoneNumbers: state.doctors[index].phoneNumbers.isEmpty
                            ? []
                            : state.doctors[index].phoneNumbers.first.isEmpty
                                ? []
                                : state.doctors[index].phoneNumbers.first
                                    .map((e) => PhoneNumber2Model(phoneNumber: e))
                                    .toList(),
                        position: state.doctors[index].position,
                        rating: state.doctors[index].rating + 0,
                        specializations: [],
                        workExperience: 0),
                  );
                },
                itemCount: state.doctors.length,
                fetchMoreFunction: () {
                  context.read<MapOrganizationBloc>().add(MapGetMoreDoctorsEvent());
                },
                hasMoreToFetch: state.doctorsNext != null,
                errorWidget: const SizedBox()),
          ),
        );
      },
    );
  }
}
