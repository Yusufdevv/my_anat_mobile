import 'package:json_annotation/json_annotation.dart';

part 'generic_pagination.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GenericPagination<T>{
  @JsonKey(name: 'current_page',defaultValue: 0)
  final int currentPage;
  @JsonKey(name: 'total_pages',defaultValue: 0)
  final int totalPages;
  @JsonKey(name: 'results',defaultValue: [])
  final List<T> results;
  @JsonKey(name:'count', defaultValue:0,)
  final int count;


  GenericPagination({required this.currentPage,required this.totalPages,required this.results,
    required this.count});
  factory GenericPagination.fromJson(Map<String,dynamic> json,T Function(Object?) fetch)=>_$GenericPaginationFromJson(json,fetch);
}