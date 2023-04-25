import 'dart:async';

import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/common/domain/usecases/like_unlike_doctor_stream_usecase.dart';
import 'package:anatomica/features/common/domain/usecases/like_unlike_vacancy_stream_usecase.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_params.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_list.dart';
import 'package:anatomica/features/vacancy/domain/usecases/vacancy_list.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'vacancy_search_event.dart';
part 'vacancy_search_state.dart';

class VacancySearchBloc extends Bloc<VacancySearchEvent, VacancySearchState> {
  final VacancyListUseCase vacancyListUseCase;
  late CandidateListUseCase candidateListUseCase;
  final LikeUnlikeVacancyStreamUseCase _likeUnlikeVacancyStreamUseCase;
  final LikeUnlikeDoctorStreamUseCase _likeUnlikeDoctorStreamUseCase;
  late StreamSubscription<VacancyListEntity> _likeUnlikeVacancySubscription;
  late StreamSubscription<CandidateListEntity> _likeUnlikeCandidateSubscription;

  EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) =>
      (events, mapper) => events.debounceTime(duration).flatMap(mapper);

  VacancySearchBloc({
    required this.vacancyListUseCase,
    required this.candidateListUseCase,
    required LikeUnlikeVacancyStreamUseCase likeUnlikeVacancyStreamUseCase,
    required LikeUnlikeDoctorStreamUseCase likeUnlikeDoctorStreamUseCase,
  })  : _likeUnlikeDoctorStreamUseCase = likeUnlikeDoctorStreamUseCase,
        _likeUnlikeVacancyStreamUseCase = likeUnlikeVacancyStreamUseCase,
        super(const VacancySearchState(
          status: FormzStatus.pure,
          vacancyList: [],
          vacancyPaginatorStatus: PaginatorStatus.PAGINATOR_LOADING,
          candidatePaginatorStatus: PaginatorStatus.PAGINATOR_LOADING,
          fetchMoreVacancy: false,
          fetchMoreCandidate: false,
          candidateList: [],
        )) {
    _likeUnlikeCandidateSubscription = _likeUnlikeDoctorStreamUseCase.call(NoParams()).listen((event) {
      add(LikeUnlikeCandidateEvent(candidate: event));
    });
    _likeUnlikeVacancySubscription = _likeUnlikeVacancyStreamUseCase.call(NoParams()).listen((event) {
      add(LikeUnlikeVacancyEvent(vacancy: event));
    });
    on<GetVacancySearchEvent>((event, emit) async {
      final response = await vacancyListUseCase
          .call(VacancyListParams(vacancyParamsEntity: VacancyParamsEntity(search: event.search)));
      if (response.isRight) {
        final result = response.right;
        emit(state.copyWith(
            fetchMoreVacancy: state.nextVacancy != null,
            nextVacancy: state.nextVacancy,
            vacancyList: result.results,
            vacancyPaginatorStatus: PaginatorStatus.PAGINATOR_SUCCESS));
      } else {
        emit(state.copyWith(vacancyPaginatorStatus: PaginatorStatus.PAGINATOR_ERROR));
      }
    }, transformer: debounce(const Duration(milliseconds: 300)));

    on<GetCandidateSearchEvent>((event, emit) async {
      final response = await candidateListUseCase.call(CandidateListParams(search: event.search));
      if (response.isRight) {
        final result = response.right;
        emit(state.copyWith(
          candidateList: result.results.cast<CandidateListEntity>(),
          nextCandidate: result.next,
          fetchMoreCandidate: state.nextCandidate != null,
          candidatePaginatorStatus: PaginatorStatus.PAGINATOR_SUCCESS,
        ));
      } else {}
    }, transformer: debounce(const Duration(milliseconds: 300)));
    on<LikeUnlikeVacancyEvent>((event, emit) {
      final newList = [...state.vacancyList];
      final item = newList.firstWhere((element) => element.id == event.vacancy.id);
      newList.insert(newList.indexOf(item), event.vacancy);
      newList.remove(item);
      emit(state.copyWith(vacancyList: newList));
    });
    on<LikeUnlikeCandidateEvent>((event, emit) {
      final newList = [...state.candidateList];
      final item = newList.firstWhere((element) => element.id == event.candidate.id);
      newList.insert(newList.indexOf(item), event.candidate);
      newList.remove(item);
      emit(state.copyWith(candidateList: newList));
    });
  }
}
