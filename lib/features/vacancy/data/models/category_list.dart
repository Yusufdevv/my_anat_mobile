import 'package:anatomica/features/vacancy/domain/entities/category_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_list.g.dart';
@JsonSerializable()
class CategoryListModel extends CategoryListEntity {
  const CategoryListModel({
    required super.title,
    required super.id,
    required super.vacancyCount,
  });

  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryListModelFromJson(json);
}
