part of 'hospital_list_bloc.dart';

@Freezed()
class HospitalListState with _$HospitalListState {
  factory HospitalListState({
    @Default(CrossFadeState.showFirst) CrossFadeState crossFadeState,
    @Default([]) List<HospitalEntity> hospitals,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default('') String next,
    @Default(0) int totalCount,
  }) = _HospitalListState;
}
