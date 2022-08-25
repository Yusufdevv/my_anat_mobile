// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericPagination<T> _$GenericPaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    GenericPagination<T>(
      currentPage: json['current_page'] as int? ?? 0,
      totalPages: json['total_pages'] as int? ?? 0,
      results:
          (json['results'] as List<dynamic>?)?.map(fromJsonT).toList() ?? [],
      count: json['count'] as int? ?? 0,
    );

Map<String, dynamic> _$GenericPaginationToJson<T>(
  GenericPagination<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
      'results': instance.results.map(toJsonT).toList(),
      'count': instance.count,
    };
