// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentResponseModel _$PaymentResponseModelFromJson(
        Map<String, dynamic> json) =>
    PaymentResponseModel(
      transactionCheckoutUrl: json['transaction_checkout_url'] as String? ?? '',
      id: json['id'] as int? ?? -1,
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$PaymentResponseModelToJson(
        PaymentResponseModel instance) =>
    <String, dynamic>{
      'transaction_checkout_url': instance.transactionCheckoutUrl,
      'id': instance.id,
      'status': instance.status,
    };
