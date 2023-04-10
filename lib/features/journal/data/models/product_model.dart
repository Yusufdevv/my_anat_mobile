import 'package:anatomica/features/journal/domain/entities/data_entity.dart';
import 'package:anatomica/features/journal/domain/entities/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductModel extends ProductEntity {
  const ProductModel({
    required super.data,
    required super.type,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
