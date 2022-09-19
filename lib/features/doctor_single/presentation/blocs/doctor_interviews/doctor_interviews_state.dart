part of 'doctor_interviews_bloc.dart';

class DoctorInterviewsState {
  final List<DoctorInterviewEntity> interviews;
  final FormzStatus getInterviewStatus;
  final String? next;
  final bool fetchMore;
  final int doctorId;
  const DoctorInterviewsState({
    this.interviews = const [],
    this.getInterviewStatus = FormzStatus.pure,
    this.next = '',
    this.fetchMore = false,
    this.doctorId = 0,
  });
  DoctorInterviewsState copyWith({
    List<DoctorInterviewEntity>? interviews,
    FormzStatus? getInterviewStatus,
    String? next,
    bool? fetchMore,
    int? doctorId,
  }) =>
      DoctorInterviewsState(
        interviews: interviews ?? this.interviews,
        getInterviewStatus: getInterviewStatus ?? this.getInterviewStatus,
        next: next ?? this.next,
        fetchMore: fetchMore ?? this.fetchMore,
        doctorId: doctorId ?? this.doctorId,
      );
  @override
  List<Object?> get props => [
        interviews,
        getInterviewStatus,
        next,
        fetchMore,
        doctorId,
      ];
}
