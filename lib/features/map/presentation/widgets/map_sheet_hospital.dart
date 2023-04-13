import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapSheetHospital extends StatelessWidget {
  final double deviceWidth;
  final List<OrgMapV2Model> points;
  final OrgMapV2Model point;
  final Function(int) onPageChanged;

  const MapSheetHospital(
      {required this.onPageChanged,
      required this.points,
      required this.point,
      required this.deviceWidth,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: PageView.builder(
          controller: PageController(
            initialPage: points.indexOf(point),
            viewportFraction: 0.9,
          ),
          onPageChanged: onPageChanged,
          itemCount: points.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 8),
              child: HospitalSingleBottomSheet(
                types: points[index].types,
                deviceWidth: deviceWidth,
                id: points[index].id,
                isHospital: true,
                slug: points[index].slug,
                title: points[index].title,
                phone: points[index].phoneNumber,
                logo: points[index].logo.middle,
                address: points[index].address,
                images: points[index].images.map((e) => e.middle).toList(),
                location: Point(
                  latitude: points[index].latitude,
                  longitude: points[index].longitude,
                ),
                rating: points[index].rating,
              ),
            );
          },
        ),
      ),
    );
  }
}
