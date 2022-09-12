part of 'candidate_single_bloc.dart';

abstract class CandidateSingleEvent {
  const CandidateSingleEvent();
}

class GetCandidateSingleEvent extends CandidateSingleEvent {
  final int id;

  GetCandidateSingleEvent({required this.id});
}

class CandidateCertificateEvent extends CandidateSingleEvent {
  final int id;

  CandidateCertificateEvent({required this.id});
}

class CandidateEducationEvent extends CandidateSingleEvent {
  final int id;

  CandidateEducationEvent({required this.id});
}

class CandidateWorkEvent extends CandidateSingleEvent {
  final int id;

  CandidateWorkEvent({required this.id});
}

class GetRelatedCandidateListEvent extends CandidateSingleEvent {
  final int id;

  GetRelatedCandidateListEvent({required this.id});
}

class GetMoreRelatedCandidateListEvent extends CandidateSingleEvent {
  final int id;

  GetMoreRelatedCandidateListEvent({required this.id});
}
