import 'package:anatomica/features/profile/domain/entities/payment_card_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_card_model.g.dart';

@JsonSerializable()
class PaymentCardModel extends PaymentCardEntity {
  const PaymentCardModel({
    required super.id,
    required super.cardNumber,
    required super.balance,
    required super.cardType,
  });

  factory PaymentCardModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentCardModelFromJson(json);
}
