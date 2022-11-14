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
  final int? organizationId;
  OrganizationLinkTriggered({
    required this.organizationSlug,
    required this.organizationId,
  });
  @override
  List<Object?> get props => [organizationSlug, organizationId];
}

class JournalLinkTriggered extends DeepLinkState {
  final String? journalSlug;
  JournalLinkTriggered({required this.journalSlug});
  @override
  List<Object?> get props => [journalSlug];
}

class OnlineJournalLinkTriggered extends DeepLinkState {
  @override
  List<Object?> get props => [];
}
