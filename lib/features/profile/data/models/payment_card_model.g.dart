// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentCardModel _$PaymentCardModelFromJson(Map<String, dynamic> json) =>
    PaymentCardModel(
      id: json['id'] as int? ?? 0,
      cardNumber: json['card_number'] as String? ?? '',
      balance: json['balance'] as String? ?? '',
      cardType: json['card_type'] as String? ?? '',
    );

Map<String, dynamic> _$PaymentCardModelToJson(PaymentCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'card_number': instance.cardNumber,
      'balance': instance.balance,
      'card_type': instance.cardType,
    };
