import 'package:anatomica/features/auth/data/models/image_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class ImageEntity extends Equatable {
  @JsonKey(defaultValue: '')
  final String origin;
  @JsonKey(defaultValue: '')
  final String middle;
  @JsonKey(defaultValue: '')
  final String small;
  const ImageEntity({this.small = '', this.middle = '', this.origin = ''});
  @override
  List<Object?> get props => [origin, middle, small];
  ImageEntity copyWith({
    String? origin,
    String? middle,
    String? small,
  }) =>
      ImageEntity(middle: middle ?? this.middle, origin: origin ?? this.origin, small: small ?? this.small);
}

class ImageConverter implements JsonConverter<ImageEntity, Map<String, dynamic>?> {
  const ImageConverter();
  @override
  ImageEntity fromJson(Map<String, dynamic>? json) => ImageModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(ImageEntity object) => {};
}
