import 'package:anatomica/features/auth/domain/entities/type_entity.dart';
import 'package:anatomica/features/map/data/models/map_doctor.dart';
import 'package:anatomica/features/map/data/models/map_hospital.dart';
import 'package:anatomica/features/map/domain/entities/map_parameter.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_doctors.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_hospitals.dart';
import 'package:anatomica/features/map/domain/usecases/get_types_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'map_organization_bloc.freezed.dart';

part 'map_organization_event.dart';

part 'map_organization_state.dart';

class MapOrganizationBloc
    extends Bloc<MapOrganizationEvent, MapOrganizationState> {
  final GetMapHospitalUseCase getHospitals;
  final GetMapDoctorUseCase getDoctors;

  MapOrganizationBloc(this.getHospitals, this.getDoctors,
      {required GetTypesUseCase getTypesUseCase})
      : super(MapOrganizationState()) {
    on<_GetHospitals>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getHospitals(state.searchText, param: event.param);
      if (result.isRight) {
        print('${state.hospitals.length}isLenght141');
        emit(state.copyWith(
            hospitals: result.right, status: FormzStatus.submissionSuccess));
        print('${state.hospitals.length}isLenght141');
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<_GetDoctors>((event, emit) async {
      final result = await getDoctors(state.searchText, param: event.param);
      if (result.isRight) {
        emit(state.copyWith(
          doctors: result.right,
        ));
      } else {}
    });
    on<_ChangeSearchText>((event, emit) {
      emit(state.copyWith(searchText: event.text));

    });
  }

  EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) =>
          (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
