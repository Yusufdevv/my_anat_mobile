import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';

class VacancyEntity {
  final int currentPage;
  final int totalPages;
  final List<VacancyListEntity> results;
  final int count;

  VacancyEntity({
    required this.currentPage,
    required this.totalPages,
    required this.results,
    required this.count,
  });
}
