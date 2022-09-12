part of 'map_organization_bloc.dart';

@Freezed()
class MapOrganizationState with _$MapOrganizationState {
  factory MapOrganizationState({
    @Default([]) List<MapHospitalModel> hospitals ,
    @Default([]) List<MapDoctorModel> doctors ,
    @Default(FormzStatus.pure) FormzStatus status ,
})=_MapOrganizationState;
}


