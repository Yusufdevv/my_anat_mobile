import 'package:equatable/equatable.dart';

class ServiceSpecSuggestEntity extends Equatable {
  const ServiceSpecSuggestEntity({
    this.id = -1,
    this.name = '',
    this.type = '',
  });

  final int id;
  final String name;
  final String type;

  @override
  List<Object?> get props => [id, name, type];
}
