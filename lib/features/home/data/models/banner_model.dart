import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/home/domain/entities/banner_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BannerModel extends BannerEntity {
  const BannerModel({
    required super.title,
    required super.id,
    required super.doctor,
    required super.image,
    required super.journal,
    required super.link,
    required super.organization,
    required super.subtitle,
    required super.type,
    required super.content,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}
