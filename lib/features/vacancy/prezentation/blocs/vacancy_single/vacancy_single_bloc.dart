import 'package:anatomica/features/vacancy/data/models/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/usecases/vacancy_single.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'vacancy_single_event.dart';

part 'vacancy_single_state.dart';

class VacancySingleBloc extends Bloc<VacancySingleEvent, VacancySingleState> {
  final VacancySingleUseCase vacancySingleUseCase;

  VacancySingleBloc({required this.vacancySingleUseCase})
      : super(VacancySingleState(
          vacancyListEntity: VacancyListModel.fromJson(const {}),
          status: FormzStatus.pure,
        )) {
    on<GetSingleVacancyEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await vacancySingleUseCase.call(VacancySingleParams(slug: event.slug));
    });
  }
}
