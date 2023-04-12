import 'package:equatable/equatable.dart';

class HospitalServiceSpecialEntity extends Equatable {
  final int id;
  final String title;

  const HospitalServiceSpecialEntity({
    this.id = 0,
    this.title = '',
  });

  @override
  List<Object?> get props => [
        id,
        title,
      ];
}
