part of 'candidate_single_bloc.dart';

class CandidateSingleState extends Equatable {
  final FormzStatus status;
  final CandidateSingleEntity candidate;

  const CandidateSingleState({required this.status, required this.candidate});

  CandidateSingleState copyWith({
    FormzStatus? status,
    CandidateSingleEntity? candidate,
  }) =>
      CandidateSingleState(
        status: status ?? this.status,
        candidate: candidate ?? this.candidate,
      );

  @override
  List<Object?> get props => [status, candidate];
}
