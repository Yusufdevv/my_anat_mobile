import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_vacancies.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'hospital_vacancies_bloc.freezed.dart';
part 'hospital_vacancies_event.dart';
part 'hospital_vacancies_state.dart';

class HospitalVacanciesBloc extends Bloc<HospitalVacanciesEvent, HospitalVacanciesState> {
  final GetHospitalVacancies getVacancies;

  HospitalVacanciesBloc(this.getVacancies) : super(HospitalVacanciesState()) {
    on<_GetVacancies>((event, emit) async {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
      ));
      final result = await getVacancies(TypeParameter(id: event.organizationId));
      if (result.isRight) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionSuccess,
            vacancies: result.right.results,
            next: result.right.next,
            organizationId: event.organizationId,
            fetchMore: result.right.next != null,
          ),
        );
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
        ));
      }
    });
    on<_GetMoreVacancies>((event, emit) async {
      final result = await getVacancies(TypeParameter(id: state.organizationId, next: state.next));
      if (result.isRight) {
        emit(
          state.copyWith(
            vacancies: [...state.vacancies, ...result.right.results],
            next: result.right.next,
            fetchMore: result.right.next != null,
          ),
        );
      }
    });
  }
}
