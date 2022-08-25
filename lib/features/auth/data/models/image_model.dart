import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImageModel extends ImageEntity {
  const ImageModel({
    required super.origin,
    required super.small,
    required super.middle,
  });
  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}

class ImageConverter implements JsonConverter<ImageEntity, Map<String, dynamic>?> {
  const ImageConverter();
  @override
  ImageEntity fromJson(Map<String, dynamic>? json) => ImageModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(ImageEntity object) => {};
}
