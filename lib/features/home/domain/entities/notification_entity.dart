import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final int id;
  final String title;
  @ImageConverter()
  final ImageEntity image;
  final String type;
  final bool read;

  const NotificationEntity({
    this.image = const ImageEntity(),
    this.id = 0,
    this.type = '',
    this.title = '',
    this.read = false,
  });

  @override
  List<Object?> get props => [
        image,
        id,
        title,
        type,
        read,
      ];
}
