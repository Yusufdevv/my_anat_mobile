part of 'services_bloc.dart';

@Freezed()
class ServicesState with _$ServicesState {
  factory ServicesState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus paginationStatus,
    @Default([]) List<HospitalServiceEntity> servicesOrg,
    @Default([]) List<HospitalServiceSpecialEntity> servicesSpecial,
    String? next,
    @Default(false) bool fetchMore,
    @Default(0) int hospitalId,
    @Default(0) int specilizationId,
    @Default('') String searchQuery,
    @Default(0) int serviceCount,
    @Default(FormzStatus.pure) FormzStatus getSingleServiceStatus,
    @Default(HospitalServiceSingleEntity()) HospitalServiceSingleEntity serviceSingle,
  }) = _ServicesState;
}
