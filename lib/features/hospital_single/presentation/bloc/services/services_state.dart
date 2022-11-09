part of 'services_bloc.dart';

@Freezed()
class ServicesState with _$ServicesState {
  factory ServicesState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus paginationStatus,
    @Default([]) List<HospitalServiceEntity> services,
    String? next,
    @Default(false) bool fetchMore,
    @Default(0) int hospitalId,
    @Default('') String searchQuery,
    @Default(0) int serviceCount,
    @Default(FormzStatus.pure) FormzStatus getSingleServiceStatus,
    @Default(HospitalServiceSingleEntity()) HospitalServiceSingleEntity serviceSingle,
  }) = _ServicesState;
}
