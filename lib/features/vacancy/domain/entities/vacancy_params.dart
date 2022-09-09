import 'package:equatable/equatable.dart';

class VacancyParamsEntity extends Equatable {
  final String? search;
  final String? salary;
  final String? experience;
  final String? category;
  final String? workType;
  final String? region;
  final String? district;
  final String? organization;
  final String? ordering;
  final int? limit;
  final int? offset;

  const VacancyParamsEntity({
    this.category,
    this.search,
    this.region,
    this.organization,
    this.district,
    this.workType,
    this.experience,
    this.limit,
    this.offset,
    this.ordering,
    this.salary,
  });

  @override
  List<Object?> get props => [
        category,
        search,
        region,
        organization,
        district,
        workType,
        experience,
        limit,
        offset,
        ordering,
        salary,
      ];
}
