part of 'services_bloc.dart';

@Freezed()
class ServicesEvent with _$ServicesEvent {
  factory ServicesEvent.getServices({required int organizationId}) = _GetServices;
  factory ServicesEvent.getMoreServices() = _GetMoreServices;
  factory ServicesEvent.searchServices({required String query}) = _SearchServices;
  factory ServicesEvent.getSingleService({required int serviceId}) = _GetSingleService;
}
