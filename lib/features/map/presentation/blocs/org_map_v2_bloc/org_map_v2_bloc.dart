import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/auth/data/models/type_model.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/map/data/models/service_spec_suggest_model.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_hospitals_with_distance.dart';
import 'package:anatomica/features/map/domain/usecases/get_service_usecase.dart';
import 'package:anatomica/features/map/domain/usecases/get_types_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'org_map_v2_bloc.freezed.dart';
part 'org_map_v2_event.dart';
part 'org_map_v2_state.dart';

class OrgMapV2Bloc extends Bloc<OrgMapV2Event, OrgMapV2State> {
  final GetMapHospitalsWithDistanceUseCase useCase =
      GetMapHospitalsWithDistanceUseCase(mapRepository: serviceLocator<MapRepositoryImpl>());
  final GetTypesUseCase typesUseCase = GetTypesUseCase(repository: serviceLocator<MapRepositoryImpl>());
  final GetServicesV2UseCase serviceUsecase = GetServicesV2UseCase(repository: serviceLocator<MapRepositoryImpl>());

  OrgMapV2Bloc() : super(OrgMapV2State()) {
    on<_SuggestCategories>(suggestCategories);
    on<_SuggestServices>(suggestServices);
    on<_SuggestOrg>(suggestOrg);
    on<_GetAllCategories>(getAllCategories);
    on<_GetAllServices>(getAllServices);
    on<_ChangeTab>(changeTab);
  }

  suggestCategories(_SuggestCategories event, Emitter<OrgMapV2State> emit) async {
    emit(state.copyWith(categoryStatus: FormzStatus.submissionInProgress));
    // final result = await typesUseCase.call(null);
    // if (result.isRight) {
    //   emit(
    //     state.copyWith(
    //       entity: result.right.results,
    //       status: FormzStatus.submissionSuccess,
    //       count: result.right.count,
    //       next: result.right.next,
    //       fetchMore: result.right.next != null,
    //     ),
    //   );
    // }
  }

  suggestServices(_SuggestServices event, Emitter<OrgMapV2State> emit) async {
    emit(state.copyWith(serviceStatus: FormzStatus.submissionInProgress));
    // final result = await typesUseCase.call(null);
    // if (result.isRight) {
    //   emit(
    //     state.copyWith(
    //       : result.right.results,
    //       status: FormzStatus.submissionSuccess,
    //       count: result.right.count,
    //       next: result.right.next,
    //       fetchMore: result.right.next != null,
    //     ),
    //   );
    // }
  }

  suggestOrg(_SuggestOrg event, Emitter<OrgMapV2State> emit) async {
    emit(state.copyWith(getSuggestHospitalsStatus: FormzStatus.submissionInProgress));
    final result = await useCase.call(MapV2Params(
      next: event.params.next,
      latitude: event.params.latitude,
      longitude: event.params.longitude,
      offset: event.params.offset,
      search: event.params.search,
      title: event.params.title,
      limit: event.params.limit,
      district: event.params.district,
      previous: event.params.previous,
      region: event.params.region,
      service: event.params.service,
      specializationId: event.params.specializationId,
    ));
    if (result.isRight) {
      emit(
        state.copyWith(
          hospitals: result.right.results,
          getSuggestHospitalsStatus: FormzStatus.submissionSuccess,
          hospitalsCount: result.right.count,
          hospitalsNext: result.right.next,
          hospitalsFetchMore: result.right.next != null,
        ),
      );
    }
  }

  getAllCategories(_GetAllCategories event, Emitter<OrgMapV2State> emit) async {}

  getAllServices(_GetAllServices event, Emitter<OrgMapV2State> emit) async {}

  changeTab(_ChangeTab event, Emitter<OrgMapV2State> emit) async { 
    emit(state.copyWith(tabIndex: event.index)); 
  }
}
