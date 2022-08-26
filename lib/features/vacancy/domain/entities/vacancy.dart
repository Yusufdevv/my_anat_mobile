import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';

class VacancyEntity {
  final String next;
  final List<VacancyListEntity> results;
  final int count;

  VacancyEntity({
    required this.next,
    required this.results,
    required this.count,
  });
}
