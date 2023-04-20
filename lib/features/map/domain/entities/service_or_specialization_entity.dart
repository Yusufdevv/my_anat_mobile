import 'package:equatable/equatable.dart';

class ServiceOrSpecializationEntity extends Equatable {
  final int id;
  final String title;
  final bool isService;
  const ServiceOrSpecializationEntity({
    required this.id,
    required this.title,
    required this.isService,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        isService,
      ];
}
