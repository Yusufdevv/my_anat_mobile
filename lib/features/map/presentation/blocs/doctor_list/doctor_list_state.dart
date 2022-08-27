part of 'doctor_list_bloc.dart';


@Freezed()
 class DoctorListState with _$DoctorListState{
factory DoctorListState({
  @Default([]) List<DoctorsEntity> doctors,
  @Default(FormzStatus.pure) FormzStatus status,
  @Default('') String next,
  @Default(0) int count,
 })=_DoctorListState;
 }


