import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ImageEntity extends Equatable {
  @JsonKey(name: 'origin', defaultValue: '')
  final String origin;
  @JsonKey(name: 'middle', defaultValue: '')
  final String middle;
  @JsonKey(name: 'small', defaultValue: '')
  final String small;

  const ImageEntity({
    required this.origin,
    required this.middle,
    required this.small,
  });

  factory ImageEntity.empty() =>
      const ImageEntity(origin: '', middle: '', small: '');

  @override
  List<Object?> get props => [origin, middle, small];

  ImageEntity copyWith({
    String? origin,
    String? middle,
    String? small,
  }) =>
      ImageEntity(
        origin: origin ?? this.origin,
        middle: middle ?? this.middle,
        small: small ?? this.small,
      );
}
