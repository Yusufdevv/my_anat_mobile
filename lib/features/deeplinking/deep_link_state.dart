part of 'deep_link_bloc.dart';

@immutable
abstract class DeepLinkState extends Equatable {}

class DeepLinkInitState extends DeepLinkState {
  DeepLinkInitState();

  @override
  List<Object?> get props => [];
}

class DoctorLinkTriggered extends DeepLinkState {
  final int? doctorId;
  DoctorLinkTriggered({
    required this.doctorId,
  });
  @override
  List<Object?> get props => [doctorId];
}

class OrganizationLinkTriggered extends DeepLinkState {
  final String? organizationSlug;
  OrganizationLinkTriggered({
    required this.organizationSlug,
  });
  @override
  List<Object?> get props => [organizationSlug];
}

class JournalLinkTriggered extends DeepLinkState {
  final String? journalSlug;
  JournalLinkTriggered({required this.journalSlug});
  @override
  List<Object?> get props => [journalSlug];
}
