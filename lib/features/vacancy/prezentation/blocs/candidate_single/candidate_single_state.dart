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
  final List<CandidateListEntity> candidateList;
  final String? next;
  final PaginatorStatus paginatorStatus;
  final bool fetchMore;

  const CandidateSingleState({
    required this.status,
    required this.candidate,
    required this.certificateList,
    required this.educationList,
    required this.workEntity,
    required this.certificateStatus,
    required this.educationStatus,
    required this.workStatus,
    required this.paginatorStatus,
    required this.candidateList,
    this.next,
    required this.fetchMore,
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
    List<CandidateListEntity>? candidateList,
    final String? next,
    final PaginatorStatus? paginatorStatus,
    final bool? fetchMore,
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
        candidateList: candidateList ?? this.candidateList,
        paginatorStatus: paginatorStatus ?? this.paginatorStatus,
        next: next,
        fetchMore: fetchMore ?? this.fetchMore,
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
        candidateList,
        paginatorStatus,
        fetchMore,
        next,
      ];
}
