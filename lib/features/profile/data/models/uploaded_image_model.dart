import 'package:anatomica/features/profile/domain/entities/uploaded_image_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'uploaded_image_model.g.dart';

@JsonSerializable()
class UploadedImageModel extends UploadedImageEntity {
  const UploadedImageModel({required super.id, required super.img});
  factory UploadedImageModel.fromJson(Map<String, dynamic> json) => _$UploadedImageModelFromJson(json);
}
