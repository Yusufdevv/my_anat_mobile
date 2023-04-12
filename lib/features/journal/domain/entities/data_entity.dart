import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/journal/data/models/data_model.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class DataEntity extends Equatable {
  const DataEntity({
    this.id = -1,
    this.title = '',
    // this.slug = '',
    // this.description = '',
    // this.image = const ImageEntity(),
    // this.organization = '',
    // this.category = const CategoryEntity(),
    // this.redaction = '',
    // this.isPremium = false,
    // this.price = 0,
    // this.author = const [],
    // this.isActive = false,
    // this.publishDate = '',
    // this.tags = const [],
    // this.languageUz = false,
    // this.languageRu = false,
    // this.uzumLink = '',
  });

  final int id;
  final String title;
  // final String slug;
  // final String description;
  // @ImageConverter()
  // final ImageEntity image;
  // final String organization;
  // @CategoryEntityConverter()
  // final CategoryEntity category;
  // final String redaction;
  // final bool isPremium;
  // final int price;
  // final List<String> author;
  // final bool isActive;
  // final String publishDate;
  // final List<String> tags;
  // final bool languageUz;
  // final bool languageRu;
  // final String uzumLink;

  @override
  List<Object?> get props => [];
}

class DataConverter
    implements JsonConverter<DataEntity, Map<String, dynamic>?> {
  const DataConverter();
  @override
  DataEntity fromJson(Map<String, dynamic>? json) =>
      DataModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(DataEntity object) => {};
}
