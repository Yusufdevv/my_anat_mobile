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
          next: '',
          fetchMore: false,
          vacancyList: const [],
          vacancyOptionStatus: FormzStatus.pure,
          topOrganizationStatus: FormzStatus.pure,
          vacancyOptionList: const [],
          organizationVacancyStatus: FormzStatus.pure,
          topOrganizationEntity: TopOrganizationModel.fromJson(const {}),
          paginatorStatusOrganization: PaginatorStatus.PAGINATOR_LOADING,
          organizationVacancyList: const [],
    organizationNext:'',
          fetchMoreOrganization: false, organizationCount: 0,
        )) {
    on<GetVacancyListEvent>((event, emit) async {
      final result = await vacancyListUseCase.call(state.next);
      if (result.isRight) {
        print(result.right.count.toString()+'lenght141');
        emit(
          state.copyWith(
           next:'',
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
      print('come to get more ');
      final response =
          await vacancyListUseCase.call(state.next);
      if (response.isRight) {
        final result = response.right;
        emit(
          state.copyWith(
            next: state.next,
            vacancyList: [...state.vacancyList, ...result.results],
            paginatorStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            fetchMore: result.count > state.vacancyList.length ? true : false,
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
          organizationId: state.topOrganizationEntity.id, next: state.organizationNext));
      if (response.isRight) {
        final result = response.right;
        emit(state.copyWith(

          paginatorStatusOrganization: PaginatorStatus.PAGINATOR_SUCCESS,
          organizationCount: result.count,
          fetchMoreOrganization: result.count > state.organizationVacancyList.length ? true : false,
          organizationVacancyList: result.results,
        ));
      } else {
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
          fetchMoreOrganization: result.count > state.organizationVacancyList.length ? true : false,
          organizationVacancyList: [...state.organizationVacancyList, ...result.results],
        ));
      } else {
        state.copyWith(paginatorStatusOrganization: PaginatorStatus.PAGINATOR_ERROR);
      }
    });
  }
}
