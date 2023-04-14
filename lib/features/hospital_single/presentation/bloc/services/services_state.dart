part of 'services_bloc.dart';

@Freezed()
class ServicesState with _$ServicesState {
  factory ServicesState({
    @Default(FormzStatus.pure) FormzStatus statusOrg,
    @Default(FormzStatus.pure) FormzStatus paginationStatusOrg,
    @Default(FormzStatus.pure) FormzStatus statusSpecial,
    @Default(FormzStatus.pure) FormzStatus statusSingle,
    @Default([]) List<HospitalServiceEntity> servicesOrg,
    @Default([]) List<HospitalServiceSpecialEntity> servicesSpecial,
    String? nextOrg,
    @Default(false) bool fetchMoreOrg,
    String? nextSpecial,
    @Default(false) bool fetchMoreSpecial,
    @Default(0) int hospitalId,
    @Default(0) int specilizationId,
    @Default('') String searchQuery,
    @Default(0) int serviceCount,
    @Default(FormzStatus.pure) FormzStatus getSingleServiceStatus,
    @Default(HospitalServiceSingleEntity()) HospitalServiceSingleEntity serviceSingle,
  }) = _ServicesState;
}
