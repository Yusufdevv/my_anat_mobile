part of 'facilities_bloc.dart';

@Freezed()
class FacilitiesState with _$FacilitiesState {
  factory FacilitiesState({
    @Default([]) List<ComfortEntity> comforts,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(false) bool fetchMore,
    String? next,
    @Default(0) int organizationId,
  }) = _FacilitiesState;
}
