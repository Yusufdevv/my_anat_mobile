import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/usecases/related_vacancy.dart';
import 'package:anatomica/features/vacancy/domain/usecases/vacancy_single.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'vacancy_single_event.dart';

part 'vacancy_single_state.dart';

class VacancySingleBloc extends Bloc<VacancySingleEvent, VacancySingleState> {
  final VacancySingleUseCase vacancySingleUseCase;
  final RelatedVacancyListUseCase relatedVacancyUseCase;

  VacancySingleBloc({required this.vacancySingleUseCase, required this.relatedVacancyUseCase})
      : super(VacancySingleState(
          vacancyListEntity: VacancyListModel.fromJson(const {}),
          status: FormzStatus.pure,
          showNumber: false,
          fetchMore: false,
          currentPage: 0,
          totalPages: 0,
          relatedVacancyList: const [],
          paginatorStatus: PaginatorStatus.PAGINATOR_LOADING,
        )) {
    on<GetSingleVacancyEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await vacancySingleUseCase.call(VacancySingleParams(slug: event.slug));
      if (result.isRight) {
        emit(
            state.copyWith(status: FormzStatus.submissionSuccess, vacancyListEntity: result.right));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<ShowNumberEvent>((event, emit) {
      emit(state.copyWith(showNumber: state.showNumber ? false : true));
    });
    on<GetRelatedVacancyList>((event, emit) async {
      final result = await relatedVacancyUseCase.call(RelatedVacancyListParams(slug: event.slug));
      print('result:${result.right.results}');
      if (result.isRight) {
        emit(state.copyWith(
          paginatorStatus: PaginatorStatus.PAGINATOR_SUCCESS,
          totalPages: result.right.totalPages,
          currentPage: result.right.currentPage,
          relatedVacancyList: result.right.results.cast<VacancyListEntity>(),
        ));
      }
    });
  }
}
