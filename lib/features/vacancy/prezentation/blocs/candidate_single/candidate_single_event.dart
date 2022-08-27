part of 'candidate_single_bloc.dart';

abstract class CandidateSingleEvent {
  const CandidateSingleEvent();
}

class GetCandidateSingleEvent extends CandidateSingleEvent {
  final int id;

  GetCandidateSingleEvent({required this.id});
}
