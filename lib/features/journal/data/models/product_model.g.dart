// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      data: json['data'] == null
          ? const DataEntity()
          : const DataConverter()
              .fromJson(json['data'] as Map<String, dynamic>?),
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': const DataConverter().toJson(instance.data),
    };
