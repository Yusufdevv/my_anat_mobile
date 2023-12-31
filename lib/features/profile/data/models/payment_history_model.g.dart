// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentHistoryModel _$PaymentHistoryModelFromJson(Map<String, dynamic> json) =>
    PaymentHistoryModel(
      id: json['id'] as int? ?? -1,
      amount: json['amount'] as int? ?? 0,
      createdAt: json['created_at'] as String? ?? '',
      product: (json['product'] as List<dynamic>?)
              ?.map((e) =>
                  const ProductConverter().fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      payedAt: json['payed_at'] as String? ?? '',
    );

Map<String, dynamic> _$PaymentHistoryModelToJson(
        PaymentHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'created_at': instance.createdAt,
      'product': instance.product.map(const ProductConverter().toJson).toList(),
      'payed_at': instance.payedAt,
    };
