import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RegionEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String soato;
  const RegionEntity({this.id = 0, this.title = '', this.soato = ''});

  @override
  List<Object?> get props => [
        id,
        title,
        soato,
      ];
}
