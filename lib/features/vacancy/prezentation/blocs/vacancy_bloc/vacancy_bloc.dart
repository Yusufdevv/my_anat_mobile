import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/vacancy/data/models/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_option.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_list.dart';
import 'package:anatomica/features/vacancy/domain/usecases/organization_vacancy.dart';
import 'package:anatomica/features/vacancy/domain/usecases/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/usecases/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/usecases/vacancy_option.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'vacancy_event.dart';

part 'vacancy_state.dart';

class VacancyBloc extends Bloc<VacancyEvent, VacancyState> {
  final VacancyListUseCase vacancyListUseCase;
  final TopOrganizationUseCase topOrganizationUseCase;
  final VacancyOptionUseCase vacancyOptionUseCase;
  final OrganizationVacancyUseCase organizationVacancyUseCase;
  final CandidateListUseCase candidateListUseCase;

  VacancyBloc({
    required this.vacancyListUseCase,
    required this.topOrganizationUseCase,
    required this.vacancyOptionUseCase,
    required this.organizationVacancyUseCase,
    required this.candidateListUseCase,
  }) : super(VacancyState(
          paginatorStatus: PaginatorStatus.PAGINATOR_LOADING,
          count: 0,
          fetchMore: false,
          vacancyList: const [],
          vacancyOptionStatus: FormzStatus.pure,
          topOrganizationStatus: FormzStatus.pure,
          vacancyOptionList: const [],
          organizationVacancyStatus: FormzStatus.pure,
          topOrganizationEntity: TopOrganizationModel.fromJson(const {}),
          paginatorStatusOrganization: PaginatorStatus.PAGINATOR_LOADING,
          organizationVacancyList: const [],
          organizationNext: '',
          fetchMoreOrganization: false,
          organizationCount: 0,
          fetchMoreCandidate: false,
          candidatePaginatorStatus: PaginatorStatus.PAGINATOR_LOADING,
          candidateList: const [],
          organizationStatus: FormzStatus.submissionSuccess,
          categoryList: [],
        )) {
    on<GetVacancyListEvent>((event, emit) async {
      final result = await vacancyListUseCase.call(null);
      if (result.isRight) {
        emit(
          state.copyWith(
            next: result.right.next,
            paginatorStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            fetchMore: result.right.count > state.vacancyList.length ? true : false,
            vacancyList: result.right.results,
          ),
        );
      } else {
        emit(state.copyWith(paginatorStatus: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
    on<GetMoreVacancyListEvent>((event, emit) async {
      final response = await vacancyListUseCase.call(state.next);
      if (response.isRight) {
        final result = response.right;
        emit(
          state.copyWith(
            next: result.next,
            vacancyList: [...state.vacancyList, ...result.results],
            paginatorStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            fetchMore:
                result.count > [...state.vacancyList, ...result.results].length ? true : false,
          ),
        );
      } else {
        emit(state.copyWith(paginatorStatus: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
    on<GetTopOrganizationEvent>((event, emit) async {
      emit(state.copyWith(topOrganizationStatus: FormzStatus.submissionInProgress));
      final result = await topOrganizationUseCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
            topOrganizationEntity: result.right,
            topOrganizationStatus: FormzStatus.submissionSuccess));
        add(GetOrganizationVacancyEvent());
      } else {
        emit(state.copyWith(topOrganizationStatus: FormzStatus.submissionFailure));
      }
    });
    on<GetVacancyOptionEvent>((event, emit) async {
      emit(state.copyWith(vacancyOptionStatus: FormzStatus.submissionInProgress));
      final result = await vacancyOptionUseCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
            vacancyOptionStatus: FormzStatus.submissionSuccess, vacancyOptionList: result.right));
      } else {
        emit(state.copyWith(vacancyOptionStatus: FormzStatus.submissionFailure));
      }
    });
    on<GetOrganizationVacancyEvent>((event, emit) async {
      print('come to organizationVacancy');
      final response = await organizationVacancyUseCase
          .call(OrganizationVacancyParams(organizationId: state.topOrganizationEntity.id));
      print(response);
      print('id:${state.topOrganizationEntity.id}');
      if (response.isRight) {
        print('right');
        final result = response.right;
        emit(state.copyWith(
          paginatorStatusOrganization: PaginatorStatus.PAGINATOR_SUCCESS,
          organizationCount: result.count,
          fetchMoreOrganization: result.next != null,
          organizationVacancyList: result.results,
        ));
      } else {
        print('left');
        state.copyWith(paginatorStatusOrganization: PaginatorStatus.PAGINATOR_ERROR);
      }
    });
    on<GetMoreOrganizationVacancyEvent>((event, emit) async {
      final response = await organizationVacancyUseCase.call(OrganizationVacancyParams(
          organizationId: state.topOrganizationEntity.id, next: state.organizationNext));
      if (response.isRight) {
        final result = response.right;
        emit(state.copyWith(
          organizationNext: result.next,
          paginatorStatusOrganization: PaginatorStatus.PAGINATOR_SUCCESS,
          organizationCount: result.count,
          fetchMoreOrganization: [...state.organizationVacancyList, ...result.results].length >
                  state.organizationVacancyList.length
              ? true
              : false,
          organizationVacancyList: [...state.organizationVacancyList, ...result.results],
        ));
      } else {
        state.copyWith(paginatorStatusOrganization: PaginatorStatus.PAGINATOR_ERROR);
      }
    });
    on<GetCandidateListEvent>((event, emit) async {
      final response = await candidateListUseCase.call(const CandidateListParams());

      if (response.isRight) {
        emit(state.copyWith(
          candidatePaginatorStatus: PaginatorStatus.PAGINATOR_SUCCESS,
          candidateList: response.right.results,
          fetchMoreCandidate: response.right.next != null,
          candidateNext: response.right.next,
        ));
      } else {
        emit(state.copyWith(candidatePaginatorStatus: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
    on<GetMoreCandidateList>((event, emit) async {
      final response =
          await candidateListUseCase.call(CandidateListParams(next: state.candidateNext));
      if (response.isRight) {
        emit(state.copyWith(
          candidatePaginatorStatus: PaginatorStatus.PAGINATOR_SUCCESS,
          candidateList: [
            ...state.candidateList,
            ...response.right.results,
          ],
          fetchMoreCandidate: response.right.next != null,
          candidateNext: response.right.next,
        ));
      }
    });
  }
}
