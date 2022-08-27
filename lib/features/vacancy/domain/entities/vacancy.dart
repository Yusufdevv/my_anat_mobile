import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';

class VacancyEntity {
  String? next;
  final List<VacancyListEntity> results;
  final int count;

  VacancyEntity({
    this.next,
    required this.results,
    required this.count,
  });
}
