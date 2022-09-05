import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/vacancy/data/models/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/entities/category_list.dart';
import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_option.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_list.dart';
import 'package:anatomica/features/vacancy/domain/usecases/category_list.dart';
import 'package:anatomica/features/vacancy/domain/usecases/organization_vacancy.dart';
import 'package:anatomica/features/vacancy/domain/usecases/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/usecases/vacancy_filter.dart';
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
  final CategoryListUseCase categoryListUseCase;
  final VacancyFilterUseCase vacancyFilterUseCase;

  VacancyBloc({
    required this.vacancyListUseCase,
    required this.topOrganizationUseCase,
    required this.vacancyOptionUseCase,
    required this.organizationVacancyUseCase,
    required this.candidateListUseCase,
    required this.categoryListUseCase,
    required this.vacancyFilterUseCase,
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
          categoryList: const [],
          categoryStatus: FormzStatus.pure,
          filterStatus: FormzStatus.pure,
          vacancyFilterList: const [],
        )) {
    on<GetVacancyListEvent>((event, emit) async {
      final result = await vacancyListUseCase.call(VacancyListParams(category: event.category));
      if (result.isRight) {
        print('result.right.next ${result.right.next}');
        emit(
          state.copyWith(
            next: result.right.next,
            paginatorStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            fetchMore: result.right.next != null,
            vacancyList: result.right.results,
          ),
        );
      } else {
        emit(state.copyWith(paginatorStatus: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
    on<GetMoreVacancyListEvent>((event, emit) async {
      print('state.next ${state.next}');
      print(' come to getMore vancacies event');
      final response = await vacancyListUseCase
          .call(VacancyListParams(next: state.next, category: event.category));
      if (response.isRight) {
        final result = response.right;
        emit(
          state.copyWith(
            next: result.next,
            vacancyList: [...state.vacancyList, ...result.results],
            paginatorStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            fetchMore: result.next != null,
          ),
        );
      } else {
        emit(state.copyWith(paginatorStatus: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
    on<GetTopOrganizationEvent>((event, emit) async {
      emit(state.copyWith(topOrganizationStatus: FormzStatus.submissionInProgress));
      final result = await topOrganizationUseCase.call(const TopOrganizationParams());
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
      final response = await organizationVacancyUseCase.call(OrganizationVacancyParams(
          organizationId: state.topOrganizationEntity.id, category: event.category));
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
    on<GetCategoryListEvent>((event, emit) async {
      emit(state.copyWith(categoryStatus: FormzStatus.submissionInProgress));
      final result = await categoryListUseCase.call(const CategoryListParams());
      if (result.isRight) {
        emit(state.copyWith(
          categoryList: result.right.results.cast<CategoryListEntity>(),
          categoryStatus: FormzStatus.submissionSuccess,
        ));
      } else {
        emit(state.copyWith(categoryStatus: FormzStatus.submissionFailure));
      }
    });
    on<GetVacancyFilterEvent>((event, emit) async {
      emit(state.copyWith(filterStatus: FormzStatus.submissionInProgress));
      final response = await vacancyFilterUseCase.call(NoParams());
      if (response.isRight) {
        final result = response.right;
        emit(state.copyWith(
          filterStatus: FormzStatus.submissionSuccess,
          vacancyFilterList: result,
        ));
      } else {
        emit(state.copyWith(filterStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
