part of 'hospital_list_bloc.dart';

class HospitalListState extends Equatable {
  final CrossFadeState screenState;
  const HospitalListState({
    required this.screenState,
  });

  const HospitalListState.empty([
    this.screenState = CrossFadeState.showFirst,
  ]);

  HospitalListState copyWith({CrossFadeState? screenState}) =>
      HospitalListState(screenState: screenState ?? this.screenState);
  @override
  List<Object?> get props => [screenState];
}
