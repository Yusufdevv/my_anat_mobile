import 'package:anatomica/features/profile/domain/entities/license_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'license.g.dart';

@JsonSerializable()
class LicenseModel extends LicenseEntity {
  factory LicenseModel.fromJson(Map<String, dynamic> json) =>
      _$LicenseModelFromJson(json);

  const LicenseModel({
    required String url,
    required int size,
  }) : super(
          url: url,
          size: size,
        );

  factory LicenseModel.empty() {
    return const LicenseModel(
      url: '',
      size: 0,
    );
  }

  @override
  String toString() {
    return 'LicenseModel(url: $url,size: $size)';
  }
}
