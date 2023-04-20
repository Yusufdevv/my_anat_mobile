import 'package:anatomica/features/map/domain/entities/doctor_map_entity.dart';
import 'package:anatomica/features/map/presentation/widgets/doctor_single_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapSheetDoctor extends StatelessWidget {
  final List<DoctorMapEntity> doctors;
  final DoctorMapEntity initialPoint;
  final Function(int) onPageChanged;
  final double deviceWidth;

  const MapSheetDoctor(
      {required this.deviceWidth,
      required this.onPageChanged,
      required this.initialPoint,
      required this.doctors,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: PageView.builder(
          controller: PageController(
            initialPage: doctors.indexOf(initialPoint),
            viewportFraction: 0.9,
          ),
          physics: const BouncingScrollPhysics(),
          onPageChanged: onPageChanged,
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 8),
              child: DoctorSingleBottomSheet(
                deviceWidth: deviceWidth,
                id: doctors[index].id,
                isHospital: false,
                specialization: doctors[index].position,
                slug: '',
                hospital: doctors[index].organizationName,
                title: doctors[index].doctorName,
                //  todo which phone
                phone: doctors[index].phoneNumbers.isNotEmpty ? doctors[index].phoneNumbers[0].first : '',
                address: doctors[index].address,
                images: [doctors[index].image.middle],
                location: Point(latitude: doctors[index].latitude, longitude: doctors[index].longitude),
                rating: doctors[index].rating + 0,
              ),
            );
          }),
    );
  }
}
