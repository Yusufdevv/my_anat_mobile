import 'package:anatomica/features/profile/domain/entities/type_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'type.g.dart';

@JsonSerializable()
class TypeModel extends TypeEntity {
  factory TypeModel.fromJson(Map<String, dynamic> json) =>
      _$TypeModelFromJson(json);

  const TypeModel({
    required int id,
    required String title,
  }) : super(id: id, title: title);

  factory TypeModel.empty() {
    return const TypeModel(id: 0, title: '');
  }

  @override
  String toString() {
    return 'TypeModel(id: $id,title: $title)';
  }
}
