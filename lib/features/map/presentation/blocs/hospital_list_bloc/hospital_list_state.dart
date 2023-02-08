part of 'hospital_list_bloc.dart';

@Freezed()
class HospitalListState with _$HospitalListState {
  factory HospitalListState({
    @Default(CrossFadeState.showFirst) CrossFadeState crossFadeState,
    @Default([]) List<OrgMapV2Model> hospitals,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(0) count,
    String? next,
    @Default(false) bool fetchMore,
  }) = _HospitalListState;
}
