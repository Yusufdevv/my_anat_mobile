part of 'hospital_single_bloc.dart';


@Freezed()
class HospitalSingleState with _$HospitalSingleState  {

  factory HospitalSingleState({
    @Default(HospitalSingleEntity()) HospitalSingleEntity hospital,
    @Default(FormzStatus.pure) FormzStatus status,
  })=_HospitalSingleState;
}


