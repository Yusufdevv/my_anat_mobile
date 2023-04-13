part of 'services_bloc.dart';

@Freezed()
class ServicesEvent with _$ServicesEvent {
  factory ServicesEvent.getServicesOrg({required int specializationId}) = _GetServicesOrg;
  factory ServicesEvent.getMoreServicesOrg() = _GetMoreServicesOrg;
  factory ServicesEvent.getServicesSpecial({required int organizationId}) = _GetServicesSpecial;
  factory ServicesEvent.getMoreServicesSpecial() = _GetMoreServicesSpecial;
  factory ServicesEvent.searchServicesOrg({required String query}) = _SearchServicesOrg;
  factory ServicesEvent.searchServicesSpecial({required String query}) = _SearchServicesSpecial;
  factory ServicesEvent.getSingleService({required int serviceId}) = _GetSingleService;
}
