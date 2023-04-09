import 'package:anatomica/features/profile/data/models/payment_card_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class PaymentCardEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'card_number', defaultValue: '')
  final String cardNumber;
  @JsonKey(name: 'balance', defaultValue: '')
  final String balance;
  @JsonKey(name: 'card_type', defaultValue: '')
  final String cardType;

  const PaymentCardEntity({this.id = 0, this.cardNumber = '', this.balance = '',this.cardType = ''});

  @override
  List<Object?> get props => [id, cardNumber, balance, cardType];

  PaymentCardEntity copyWith({
    final int? id,
    final String? cardNumber,
    final String? balance,
    final String? type,
  }) =>
      PaymentCardEntity(
        id: id ?? this.id,
        cardNumber: cardNumber ?? this.cardNumber,
        balance: balance ?? this.balance,
        cardType: type ?? this.cardType,
      );
}

class PaymentCardEntityConverter
    extends JsonConverter<PaymentCardEntity, Map<String, dynamic>?> {
  const PaymentCardEntityConverter();

  @override
  PaymentCardEntity fromJson(Map<String, dynamic>? json) =>
      PaymentCardModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(PaymentCardEntity object) => {};
}
