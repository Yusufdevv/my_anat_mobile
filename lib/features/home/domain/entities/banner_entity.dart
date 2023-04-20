import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  const BannerEntity({
    this.id = -1,
    this.title = '',
    this.subtitle = '',
    this.image = const ImageEntity(),
    this.type = '',
    this.organization = '',
    this.doctor = 0,
    this.journal = '',
    this.link = '',
    this.content = '',
  });
  final int id;
  final String title;
  final String subtitle;
  @ImageConverter()
  final ImageEntity image;
  final String type;
  final String content;
  final String organization;
  final int doctor;
  final String journal;
  final String link;

  @override
  List<Object?> get props =>
      [id, title, subtitle, image, type, organization, doctor, journal, link];
}
