import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_single.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_special_entity.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_services_org.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_services_special.dart';
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
  final GetServicesUseCase getServices = GetServicesUseCase();
  final GetSingleServiceUseCase _getSingleServiceUseCase = GetSingleServiceUseCase();
  final GetServicesSpecialUseCase _getServicesSpecialUseCase = GetServicesSpecialUseCase();

  ServicesBloc() : super(ServicesState()) {
    ///
    on<_GetServicesSpecial>((event, emit) async {
      if (kDebugMode) {
        print('get event');
      }
      emit(state.copyWith(statusSpecial: FormzStatus.submissionInProgress));
      final result = await _getServicesSpecialUseCase(ServiceSpecialParameters(orgId: event.organizationId));
      if (result.isRight) {
        emit(
          state.copyWith(
            serviceCount: result.right.count,
            statusSpecial: FormzStatus.submissionSuccess,
            servicesSpecial: result.right.results,
            hospitalId: event.organizationId,
            nextSpecial: result.right.next,
            fetchMoreSpecial: result.right.next != null,
          ),
        );
      } else {
        emit(state.copyWith(statusSpecial: FormzStatus.submissionSuccess));
      }
    });

    ///
    on<_GetMoreServicesSpecial>((event, emit) async {
      // emit(
      //   state.copyWith(statusSpecial: FormzStatus.submissionInProgress),
      // );
      final result = await _getServicesSpecialUseCase(
          ServiceSpecialParameters(orgId: state.hospitalId, next: state.nextSpecial, query: state.searchQuery));
      if (result.isRight) {
        emit(
          state.copyWith(
            statusSpecial: FormzStatus.submissionSuccess,
            nextSpecial: result.right.next,
            fetchMoreSpecial: result.right.next != null,
            servicesSpecial: [...state.servicesSpecial, ...result.right.results],
          ),
        );
      }
      // else {
      //   emit(state.copyWith(statusSpecial: FormzStatus.submissionSuccess));
      // }
    });

    ///
    on<_GetServicesOrg>((event, emit) async {
      if (kDebugMode) {
        print('get event');
      }
      emit(state.copyWith(statusOrg: FormzStatus.submissionInProgress));
      final result = await getServices(ServiceParameters(orgId: state.hospitalId, specId: event.specializationId));
      if (result.isRight) {
        emit(
          state.copyWith(
            serviceCount: result.right.count,
            statusOrg: FormzStatus.submissionSuccess,
            servicesOrg: result.right.results,
            specilizationId: event.specializationId,
            nextOrg: result.right.next,
            fetchMoreOrg: result.right.next != null,
          ),
        );
      } else {
        emit(state.copyWith(statusOrg: FormzStatus.submissionSuccess));
      }
    });

    ///
    on<_GetMoreServicesOrg>((event, emit) async {
      emit(
        state.copyWith(paginationStatusOrg: FormzStatus.submissionInProgress),
      );
      final result = await getServices(ServiceParameters(
          orgId: state.hospitalId, next: state.nextOrg, query: state.searchQuery, specId: state.specilizationId));
      if (result.isRight) {
        emit(
          state.copyWith(
            paginationStatusOrg: FormzStatus.submissionSuccess,
            nextOrg: result.right.next,
            fetchMoreOrg: result.right.next != null,
            servicesOrg: [...state.servicesOrg, ...result.right.results],
          ),
        );
      } else {
        emit(state.copyWith(paginationStatusOrg: FormzStatus.submissionSuccess));
      }
    });

    ///
    on<_SearchServicesOrg>((event, emit) async {
      print('search event');
      emit(state.copyWith(statusOrg: FormzStatus.submissionInProgress));
      final result = await getServices(
          ServiceParameters(orgId: state.hospitalId, query: event.query, specId: state.specilizationId));
      if (result.isRight) {
        emit(
          state.copyWith(
            statusOrg: FormzStatus.submissionSuccess,
            servicesOrg: result.right.results,
            nextOrg: result.right.next,
            fetchMoreOrg: result.right.next != null,
            searchQuery: event.query,
          ),
        );
      } else {
        emit(state.copyWith(statusOrg: FormzStatus.submissionSuccess));
      }
    }, transformer: restartable());

    ///
    on<_GetSingleService>((event, emit) async {
      emit(state.copyWith(getSingleServiceStatus: FormzStatus.submissionInProgress));
      final result = await _getSingleServiceUseCase.call(event.serviceId);
      if (result.isRight) {
        emit(state.copyWith(getSingleServiceStatus: FormzStatus.submissionSuccess, serviceSingle: result.right));
      } else {
        emit(state.copyWith(getSingleServiceStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
