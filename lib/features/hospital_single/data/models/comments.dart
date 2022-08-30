import 'package:anatomica/features/common/models/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comments.g.dart';

@JsonSerializable()
class CommentModel {
  @JsonKey(name: 'comment', defaultValue: '')
  final String comment;
  @JsonKey(name: 'rating', defaultValue: 0)
  final double rating;
  @JsonKey(name: 'status', defaultValue: '')
  final String status;
  @JsonKey(name: 'created_at', defaultValue: '')
  final String createdAt;
  @JsonKey(name: 'user_full_name', defaultValue: '')
  final String fullName;
  @JsonKey(
    name: 'user_image',
  )
  final AssetModel userImage;
  @JsonKey(name: 'is_own', defaultValue: false)
  final bool isOwn;

  CommentModel(
      {required this.fullName,
      required this.rating,
      required this.status,
      required this.createdAt,
      required this.comment,
      required this.isOwn,
      required this.userImage});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    if (json['user_image'] == null) {
      json.update('user_image', (value) => AssetModel.empty().toJson());
    }
    return _$CommentModelFromJson(json);
  }


}
