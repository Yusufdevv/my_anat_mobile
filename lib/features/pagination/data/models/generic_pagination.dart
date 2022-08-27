import 'package:json_annotation/json_annotation.dart';

part 'generic_pagination.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GenericPagination<T> {
  @JsonKey(name: 'next_link')
  final String? next;
  @JsonKey(name: 'previous_link', defaultValue: '')
  final String previous;
  @JsonKey(name: 'results', defaultValue: [])
  final List<T> results;
  @JsonKey(
    name: 'total_count',
    defaultValue: 0,
  )
  final int count;

  GenericPagination(
      {this.next, required this.previous, required this.results, required this.count});

  factory GenericPagination.fromJson(Map<String, dynamic> json, T Function(Object?) fetch) =>
      _$GenericPaginationFromJson(json, fetch);
}
