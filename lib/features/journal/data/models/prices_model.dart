import 'package:anatomica/features/journal/domain/entities/prices_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prices_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PricesModel extends PricesEntity {
  const PricesModel({
    required super.organizationSubscribe,
    required super.journalSubscribe,
    required super.doctorSubscribe,
    required super.articlePublish,
  });
  factory PricesModel.fromJson(Map<String, dynamic> json) => _$PricesModelFromJson(json);
}
