import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/map/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/map/domain/usecases/get_doctors.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'doctor_list_bloc.freezed.dart';
part 'doctor_list_event.dart';
part 'doctor_list_state.dart';

class DoctorListBloc extends Bloc<DoctorListEvent, DoctorListState> {
  final GetDoctorsUseCase useCase;

  DoctorListBloc(this.useCase) : super(DoctorListState()) {
    on<_GetDoctors>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(
        MapV2Params(
          search: event.search,
          latitude: event.myPoint.latitude,
          longitude: event.myPoint.longitude,
          radius: 150,
        ),
      );
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            doctors: result.right.results,
            next: result.right.next,
            fetchMore: result.right.next != null));
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
        ));
      }
    });

    on<_GetMoreDoctors>((event, emit) async {
      final result = await useCase(MapV2Params(next: state.next));
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          doctors: [...state.doctors, ...result.right.results],
          next: result.right.next,
          fetchMore: result.right.next != null,
        ));
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
        ));
      }
    });
  }

  EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) =>
      (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
