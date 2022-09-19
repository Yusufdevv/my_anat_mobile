import 'package:anatomica/features/hospital_single/domain/entities/post_comment_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_comment_model.g.dart';

@JsonSerializable()
class PostCommentModel extends PostCommentEntity {
  PostCommentModel({required super.rating, required super.comment});
  Map<String, dynamic> toJson() => _$PostCommentModelToJson(this);
}
