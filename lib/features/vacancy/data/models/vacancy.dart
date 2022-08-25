import 'package:anatomica/features/vacancy/domain/entities/vacancy.dart';

class VacancyModel extends VacancyEntity {
  VacancyModel({
    required super.currentPage,
    required super.totalPages,
    required super.results,
    required super.count,
  });
}
