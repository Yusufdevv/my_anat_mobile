import 'package:anatomica/features/auth/domain/entities/image_entity.dart';

class CommentEntity {
  final int id;
  final String comment;
  final double rating;
  final String status;
  final String createdAt;
  final String userFullName;
  final String fullName;
  @ImageConverter()
  final ImageEntity userImage;
  final bool isOwn;
  const CommentEntity({
    this.status = '',
    this.id = 0,
    this.comment = '',
    this.rating = 0,
    this.createdAt = '',
    this.userFullName = '',
    this.fullName = '',
    this.userImage = const ImageEntity(),
    this.isOwn = false,
  });
}
