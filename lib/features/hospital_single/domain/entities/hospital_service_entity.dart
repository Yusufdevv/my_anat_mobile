import 'package:equatable/equatable.dart';

class HospitalServiceEntity extends Equatable {
  final int id;
  final String name;
  final String url;
  const HospitalServiceEntity({
    this.id = 0,
    this.name = '',
    this.url = '',
  });

  @override
  List<Object?> get props => [id, name, url];
}
