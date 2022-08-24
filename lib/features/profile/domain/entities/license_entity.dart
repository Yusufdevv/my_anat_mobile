import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class LicenseEntity extends Equatable {
  @JsonKey(name: 'url', defaultValue: '')
  final String url;
  @JsonKey(name: 'size', defaultValue: 0)
  final int size;

  const LicenseEntity({
    required this.url,
    required this.size,
  });

  factory LicenseEntity.empty() => const LicenseEntity(url: '', size: 0);

  @override
  List<Object?> get props => [url, size];

  LicenseEntity copyWith({
    String? url,
    int? size,
  }) =>
      LicenseEntity(
        url: url ?? this.url,
        size: size ?? this.size,
      );
}
