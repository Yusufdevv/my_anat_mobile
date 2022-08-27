import 'package:anatomica/features/common/models/logo.dart';

class HospitalEntity {
  final String title ;
  final String addres;
  final List<AssetModel> images;
  final double rating ;
  HospitalEntity({required this.rating,required this.title,required this.images,required this.addres});
}