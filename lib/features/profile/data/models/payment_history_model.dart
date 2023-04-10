import 'package:anatomica/features/journal/domain/entities/product_entity.dart';
import 'package:anatomica/features/profile/domain/entities/payment_history_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_history_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentHistoryModel extends PaymentHistoryEntity {
  const PaymentHistoryModel({
    required super.amount,
    required super.description,
    required super.id,
    required super.createdAt,
    required super.monthCount,
    required super.payedAt,
    required super.products,
    required super.provider,
    required super.purpose,
    required super.status,
    required super.transactionId,
  });

  factory PaymentHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoryModelFromJson(json);
}
