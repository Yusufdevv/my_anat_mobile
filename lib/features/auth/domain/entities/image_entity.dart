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
}
