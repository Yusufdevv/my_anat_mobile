part of 'services_bloc.dart';

@Freezed()
class ServicesEvent with _$ServicesEvent {
  factory ServicesEvent.getComments({int? organizationId})=_GetServices;
}
