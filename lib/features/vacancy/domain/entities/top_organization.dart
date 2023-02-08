import 'package:anatomica/features/vacancy/data/models/top_organization.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class TopOrganizationEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'slug', defaultValue: '')
  final String slug;
  @LogoEntityConverter()
  final LogoEntity logo;
  @JsonKey(name: 'vacancy_count', defaultValue: 0)
  final int vacancyCount;

  const TopOrganizationEntity(
      {required this.title,
      required this.vacancyCount,
      required this.logo,
      required this.slug,
      required this.id});

  @override
  List<Object?> get props => [id, logo, vacancyCount, title, slug];
}

class LogoEntity extends Equatable {
  @JsonKey(name: 'origin', defaultValue: '')
  final String origin;
  @JsonKey(name: 'middle', defaultValue: '')
  final String middle;
  @JsonKey(name: 'small', defaultValue: '')
  final String small;
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;

  const LogoEntity({
    this.middle = '',
    this.origin = '',
    this.small = '',
    this.id = 0,
  });

  @override
  List<Object?> get props => [origin, middle, small, id];
}

class LogoEntityConverter
    extends JsonConverter<LogoEntity, Map<String, dynamic>?> {
  const LogoEntityConverter();

  @override
  LogoEntity fromJson(Map<String, dynamic>? json) =>
      LogoModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(LogoEntity object) => {};
}
