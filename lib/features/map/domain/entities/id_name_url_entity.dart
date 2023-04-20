import 'package:anatomica/features/map/data/models/id_name_url_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class IdNameUrlEntity extends Equatable {
  final int id;
  final String name;
  final String url;
  const IdNameUrlEntity({
    this.name = '',
    this.id = -1,
    this.url = '',
  });

  @override
  List<Object?> get props => [
        id,
        name,
        url,
      ];
}

class IdNameUrlConverter extends JsonConverter<IdNameUrlEntity, Map<String, dynamic>> {
  const IdNameUrlConverter();

  @override
  IdNameUrlEntity fromJson(Map<String, dynamic> json) => IdNameUrlModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(IdNameUrlEntity object) => {};
}
