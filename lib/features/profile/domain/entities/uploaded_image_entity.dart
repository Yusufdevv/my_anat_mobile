import 'package:equatable/equatable.dart';

class UploadedImageEntity extends Equatable {
  final int id;
  final String img;
  const UploadedImageEntity({
    this.id = 0,
    this.img = '',
  });

  @override
  List<Object?> get props => [id, img];
}
