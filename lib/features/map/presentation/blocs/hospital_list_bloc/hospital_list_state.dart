part of 'hospital_list_bloc.dart';

@Freezed()
class HospitalListState with _$HospitalListState {
  factory HospitalListState({
    @Default(CrossFadeState.showFirst) CrossFadeState crossFadeState,
    @Default([]) List<HospitalEntity> hospitals,
    @Default(FormzStatus.pure) FormzStatus status,
    String? next,
    @Default(false) bool fetchMore,
  }) = _HospitalListState;
}
