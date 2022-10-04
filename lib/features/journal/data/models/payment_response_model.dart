import 'package:anatomica/features/journal/domain/entities/payment_response_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentResponseModel extends PaymentResponseEntity {
  const PaymentResponseModel({required super.transactionCheckoutUrl, required super.id});
  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) => _$PaymentResponseModelFromJson(json);
}
