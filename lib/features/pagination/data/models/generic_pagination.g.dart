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
      next: json['next_link'] as String?,
      previous: json['previous_link'] as String?,
      results:
          (json['results'] as List<dynamic>?)?.map(fromJsonT).toList() ?? [],
      count: json['total_count'] as int? ?? 0,
    );

Map<String, dynamic> _$GenericPaginationToJson<T>(
  GenericPagination<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'next_link': instance.next,
      'previous_link': instance.previous,
      'results': instance.results.map(toJsonT).toList(),
      'total_count': instance.count,
    };
