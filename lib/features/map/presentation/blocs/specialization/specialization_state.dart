part of 'specialization_bloc.dart';

@Freezed()
class SpecializationState with _$SpecializationState {
  factory SpecializationState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default([]) List<TitlerModel> specializations,
    @Default(0) int selectedId,
    @Default(0) int count,
    String? next,
  }) = _SpecializationState;
}
