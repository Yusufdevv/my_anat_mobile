import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class LicenseEntity extends Equatable {
  @JsonKey(defaultValue: '')
  final String url;
  @JsonKey(defaultValue: 0)
  final int size;
  const LicenseEntity({this.size = 0, this.url = ''});

  @override
  List<Object?> get props => [url, size];
}
