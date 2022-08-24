import 'package:anatomica/features/profile/domain/entities/image_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.g.dart';

@JsonSerializable(createToJson: false)
class ImageModel extends ImageEntity {
  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  const ImageModel({
    required String origin,
    required String middle,
    required String small,
  }) : super(origin: origin, middle: middle, small: small);

  factory ImageModel.empty() {
    return const ImageModel(
      origin: '',
      middle: '',
      small: '',
    );
  }

  @override
  String toString() {
    return 'ImageModel(origin: $origin,middle: $middle,small: $small)';
  }
}
