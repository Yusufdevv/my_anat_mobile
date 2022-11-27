import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/common/data/models/logo.dart';

class HospitalEntity {
  final String slug;
  @ImageConverter()
  final ImageEntity logo;
  final String title;
  final String addres;
  final List<AssetModel> images;
  final double rating;
  final int id;
  HospitalEntity({
    required this.rating,
    required this.title,
    required this.images,
    required this.addres,
    required this.slug,
    required this.id,
    this.logo = const ImageEntity()
  });
}
