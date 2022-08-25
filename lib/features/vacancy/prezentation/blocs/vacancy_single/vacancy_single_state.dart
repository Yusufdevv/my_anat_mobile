part of 'vacancy_single_bloc.dart';

class VacancySingleState extends Equatable {
  final FormzStatus status;
  final VacancyListEntity vacancyListEntity;

  const VacancySingleState({
    required this.vacancyListEntity,
    required this.status,
  });

  VacancySingleState copyWith({
    FormzStatus? status,
    VacancyListEntity? vacancyListEntity,
  }) =>
      VacancySingleState(
        vacancyListEntity: vacancyListEntity ?? this.vacancyListEntity,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [status, vacancyListEntity];
}
