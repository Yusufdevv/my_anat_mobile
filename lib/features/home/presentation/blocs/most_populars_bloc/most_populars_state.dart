part of 'most_populars_bloc.dart';

@freezed
class MostPopularsState with _$MostPopularsState {
  factory MostPopularsState({
    @Default([]) List popularDoctors,
    @Default(FormzStatus.pure) FormzStatus popularDoctorsStatus,
    String? popularDoctorsNext,
    @Default(false) bool popularDoctorsFetchMore,
    @Default([]) List popularOrgs,
    @Default(FormzStatus.submissionSuccess) FormzStatus popularOrgsStatus,
    String? popularOrgsNext,
    @Default(false) bool popularOrgsFetchMore,
  }) = _MostPopularsState;
}
