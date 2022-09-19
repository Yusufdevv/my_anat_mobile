import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:equatable/equatable.dart';

class DoctorInterviewEntity extends Equatable {
  final int id;
  final String url;
  @ImageConverter()
  final ImageEntity image;
  final String title;
  final String slug;
  final int videoDuration;
  final String content;
  final String description;
  final int viewCount;
  final bool isActive;
  final List<int> doctors;
  const DoctorInterviewEntity({
    this.id = 0,
    this.url = '',
    this.image = const ImageEntity(),
    this.title = '',
    this.slug = '',
    this.videoDuration = 0,
    this.content = '',
    this.description = '',
    this.viewCount = 0,
    this.isActive = false,
    this.doctors = const [],
  });

  @override
  List<Object?> get props => [
        id,
        url,
        image,
        title,
        slug,
        videoDuration,
        content,
        description,
        viewCount,
        isActive,
        doctors,
      ];
}
