import 'package:anatomica/features/journal/data/models/product_model.dart';
import 'package:anatomica/features/journal/domain/entities/data_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
    this.type = '',
    this.data = const DataEntity(),
  });

  final String type;
  @DataConverter()
  final DataEntity data;

  @override
  List<Object?> get props => [type, data];
}

class ProductConverter implements JsonConverter<ProductEntity, Map<String, dynamic>?> {
  const ProductConverter();
  @override
  ProductEntity fromJson(Map<String, dynamic>? json) => ProductModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(ProductEntity object) => {};
}
