import 'package:anatomica/features/map/data/models/map_doctor.dart';
import 'package:anatomica/features/map/domain/entities/map_parameter.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_doctors.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_doctor_bloc.freezed.dart';
part 'map_doctor_event.dart';
part 'map_doctor_state.dart';

class MapDoctorBloc extends Bloc<MapDoctorEvent, MapDoctorState> {
  final GetMapDoctorUseCase getDoctors;

  MapDoctorBloc(this.getDoctors) : super(MapDoctorState()) {
    on<_GetMapDoctors>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getDoctors(event.search, param: event.params);
      if (result.isRight) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess, doctors: result.right));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
