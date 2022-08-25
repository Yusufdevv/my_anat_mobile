import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/vacancy/data/models/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_option.dart';
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

  VacancyBloc(
      {required this.vacancyListUseCase,
      required this.topOrganizationUseCase,
      required this.vacancyOptionUseCase,
      required this.organizationVacancyUseCase})
      : super(VacancyState(
          paginatorStatus: PaginatorStatus.PAGINATOR_LOADING,
          count: 0,
          totalPages: 0,
          currentPage: 0,
          fetchMore: false,
          vacancyList: const [],
          vacancyOptionStatus: FormzStatus.pure,
          topOrganizationStatus: FormzStatus.pure,
          vacancyOptionList: const [],
          organizationVacancyStatus: FormzStatus.pure,
          topOrganizationEntity: TopOrganizationModel.fromJson(const {}),
          paginatorStatusOrganization: PaginatorStatus.PAGINATOR_LOADING,
          organizationVacancyList: const [],
          totalPageOrganization: 0,
          currentPageOrganization: 0,
          fetchMoreOrganization: false,
        )) {
    on<GetVacancyListEvent>((event, emit) async {
      final result = await vacancyListUseCase.call(VacancyListParams(next: state.currentPage));
      if (result.isRight) {
        emit(
          state.copyWith(
            currentPage: result.right.currentPage,
            totalPages: result.right.totalPages,
            paginatorStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            fetchMore: result.right.totalPages > result.right.currentPage ? true : false,
            vacancyList: result.right.results,
          ),
        );
      } else {
        emit(state.copyWith(paginatorStatus: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
    on<GetMoreVacancyListEvent>((event, emit) async {
      print('come to get more ');
      final response =
          await vacancyListUseCase.call(VacancyListParams(next: state.currentPage + 1));
      if (response.isRight) {
        final result = response.right;
        emit(
          state.copyWith(
            currentPage: result.currentPage,
            totalPages: result.totalPages,
            vacancyList: [...state.vacancyList, ...result.results],
            paginatorStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            fetchMore: result.totalPages > result.currentPage ? true : false,
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
      final response = await organizationVacancyUseCase.call(OrganizationVacancyParams(
          organizationId: state.topOrganizationEntity.id, next: state.currentPageOrganization));
      if (response.isRight) {
        final result = response.right;
        emit(state.copyWith(
          currentPageOrganization: result.currentPage,
          paginatorStatusOrganization: PaginatorStatus.PAGINATOR_SUCCESS,
          totalPageOrganization: result.totalPages,
          fetchMoreOrganization: result.totalPages > result.currentPage ? true : false,
          organizationVacancyList: result.results,
        ));
      } else {
        state.copyWith(paginatorStatusOrganization: PaginatorStatus.PAGINATOR_ERROR);
      }
    });
    on<GetMoreOrganizationVacancyEvent>((event, emit) async {
      final response = await organizationVacancyUseCase.call(OrganizationVacancyParams(
          organizationId: state.topOrganizationEntity.id, next: state.currentPageOrganization));
      if (response.isRight) {
        final result = response.right;
        emit(state.copyWith(
          currentPageOrganization: result.currentPage,
          paginatorStatusOrganization: PaginatorStatus.PAGINATOR_SUCCESS,
          totalPageOrganization: result.totalPages,
          fetchMoreOrganization: result.totalPages > result.currentPage ? true : false,
          organizationVacancyList: [...state.organizationVacancyList, ...result.results],
        ));
      } else {
        state.copyWith(paginatorStatusOrganization: PaginatorStatus.PAGINATOR_ERROR);
      }
    });
  }
}
