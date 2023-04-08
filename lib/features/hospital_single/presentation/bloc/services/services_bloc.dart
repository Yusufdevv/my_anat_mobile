import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_single.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_services.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_single_service_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'services_bloc.freezed.dart';
part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final GetServicesUseCase getServices;
  final GetSingleServiceUseCase _getSingleServiceUseCase;
  ServicesBloc(this.getServices,
      {required GetSingleServiceUseCase getSingleServiceUseCase})
      : _getSingleServiceUseCase = getSingleServiceUseCase,
        super(ServicesState()) {
    on<_GetServices>((event, emit) async {
      if (kDebugMode) {
        print('get event');
      }
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
      ));
      final result =
          await getServices(ServiceParameters(id: event.organizationId));
      if (result.isRight) {
        emit(
          state.copyWith(
            serviceCount: result.right.count,
            status: FormzStatus.submissionSuccess,
            services: result.right.results,
            hospitalId: event.organizationId,
            next: result.right.next,
            fetchMore: result.right.next != null,
          ),
        );
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
        ));
      }
    });
    on<_GetMoreServices>((event, emit) async {
      emit(
        state.copyWith(paginationStatus: FormzStatus.submissionInProgress),
      );
      final result = await getServices(ServiceParameters(
          id: state.hospitalId, next: state.next, query: state.searchQuery));
      if (result.isRight) {
        emit(
          state.copyWith(
            paginationStatus: FormzStatus.submissionSuccess,
            next: result.right.next,
            fetchMore: result.right.next != null,
            services: [...state.services, ...result.right.results],
          ),
        );
      } else {
        emit(state.copyWith(paginationStatus: FormzStatus.submissionSuccess));
      }
    });
    on<_SearchServices>((event, emit) async {
      print('search event');
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
      ));
      final result = await getServices(
          ServiceParameters(id: state.hospitalId, query: event.query));
      if (result.isRight) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionSuccess,
            services: result.right.results,
            next: result.right.next,
            fetchMore: result.right.next != null,
            searchQuery: event.query,
          ),
        );
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
        ));
      }
    }, transformer: restartable());
    on<_GetSingleService>((event, emit) async {
      emit(state.copyWith(
          getSingleServiceStatus: FormzStatus.submissionInProgress));
      final result = await _getSingleServiceUseCase.call(event.serviceId);
      if (result.isRight) {
        emit(state.copyWith(
            getSingleServiceStatus: FormzStatus.submissionSuccess,
            serviceSingle: result.right));
      } else {
        emit(state.copyWith(
            getSingleServiceStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
