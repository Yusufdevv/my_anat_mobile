part of 'candidate_single_bloc.dart';

class CandidateSingleState extends Equatable {
  final FormzStatus status;
  final CandidateSingleEntity candidate;
  final List<CertificateEntity> certificateList;
  final List<CandidateWorkEntity> workEntity;
  final List<CandidateEducationEntity> educationList;
  final FormzStatus certificateStatus;
  final FormzStatus workStatus;
  final FormzStatus educationStatus;

  const CandidateSingleState({
    required this.status,
    required this.candidate,
    required this.certificateList,
    required this.educationList,
    required this.workEntity,
    required this.certificateStatus,
    required this.educationStatus,
    required this.workStatus,
  });

  CandidateSingleState copyWith({
    FormzStatus? status,
    CandidateSingleEntity? candidate,
    List<CertificateEntity>? certificateList,
    List<CandidateWorkEntity>? workEntity,
    List<CandidateEducationEntity>? educationList,
    FormzStatus? certificateStatus,
    FormzStatus? workStatus,
    FormzStatus? educationStatus,
  }) =>
      CandidateSingleState(
        status: status ?? this.status,
        candidate: candidate ?? this.candidate,
        certificateList: certificateList ?? this.certificateList,
        educationList: educationList ?? this.educationList,
        workEntity: workEntity ?? this.workEntity,
        certificateStatus: certificateStatus ?? this.certificateStatus,
        educationStatus: educationStatus ?? this.educationStatus,
        workStatus: workStatus ?? this.workStatus,
      );

  @override
  List<Object?> get props => [
        status,
        candidate,
        certificateList,
        educationList,
        workEntity,
        certificateStatus,
        workStatus,
        educationStatus,
      ];
}
