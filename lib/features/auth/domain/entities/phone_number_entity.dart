import 'package:equatable/equatable.dart';

class PhoneNumberEntity extends Equatable {
  final String phoneNumber;

  const PhoneNumberEntity({this.phoneNumber = ''});

  @override
  List<Object?> get props => [phoneNumber];
}


