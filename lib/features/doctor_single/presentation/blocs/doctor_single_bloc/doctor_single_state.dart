part of 'doctor_single_bloc.dart';

class DoctorSingleState extends Equatable {
  final FormzStatus getDoctorSingleStatus;
  final DoctorSingleEntity doctorSingle;
  const DoctorSingleState({
    this.getDoctorSingleStatus = FormzStatus.pure,
    this.doctorSingle = const DoctorSingleEntity(),
  });

  DoctorSingleState copyWith({
    FormzStatus? getDoctorSingleStatus,
    DoctorSingleEntity? doctorSingle,
  }) =>
      DoctorSingleState(
        doctorSingle: doctorSingle ?? this.doctorSingle,
        getDoctorSingleStatus: getDoctorSingleStatus ?? this.getDoctorSingleStatus,
      );

  @override
  List<Object?> get props => [
        doctorSingle,
        getDoctorSingleStatus,
      ];
}
