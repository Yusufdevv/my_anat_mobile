import 'package:anatomica/features/profile/domain/entities/faq_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_model.g.dart';

@JsonSerializable()
class FaqModel extends FaqEntity {
  const FaqModel({required super.title, required super.description, required super.id});
  factory FaqModel.fromJson(Map<String, dynamic> json) => _$FaqModelFromJson(json);
}
