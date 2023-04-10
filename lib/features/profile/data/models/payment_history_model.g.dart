// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentHistoryModel _$PaymentHistoryModelFromJson(Map<String, dynamic> json) =>
    PaymentHistoryModel(
      amount: json['amount'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      id: json['id'] as int? ?? -1,
      createdAt: json['created_at'] as String? ?? '',
      monthCount: json['month_count'] as int? ?? 0,
      payedAt: json['payed_at'] as String? ?? '',
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      provider: json['provider'] as String? ?? '',
      purpose: json['purpose'] as String? ?? '',
      status: json['status'] as String? ?? '',
      transactionId: json['transaction_id'] as String? ?? '',
    );

Map<String, dynamic> _$PaymentHistoryModelToJson(
        PaymentHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'purpose': instance.purpose,
      'description': instance.description,
      'status': instance.status,
      'amount': instance.amount,
      'created_at': instance.createdAt,
      'transaction_id': instance.transactionId,
      'provider': instance.provider,
      'products': instance.products,
      'month_count': instance.monthCount,
      'payed_at': instance.payedAt,
    };
