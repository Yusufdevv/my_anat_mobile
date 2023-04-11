import 'package:anatomica/features/profile/domain/entities/payment_history_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_history_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentHistoryModel extends PaymentHistoryEntity {
  const PaymentHistoryModel({
    required super.id,
    required super.amount,
    required super.createdAt,
    required super.product,
    required super.payedAt,
  });

  factory PaymentHistoryModel.fromJson(Map<String, dynamic> json) => _$PaymentHistoryModelFromJson(json);
}
