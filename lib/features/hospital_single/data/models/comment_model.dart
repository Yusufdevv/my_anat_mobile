import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comment_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CommentModel extends CommentEntity {
  CommentModel({
    required super.id,
    required super.userFullName,
    required super.rating,
    required super.status,
    required super.createdAt,
    required super.comment,
    required super.isOwn,
    required super.userImage,
    required super.fullName,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
}
