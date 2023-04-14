import 'package:equatable/equatable.dart';

class DiplomEntity extends Equatable {
  const DiplomEntity({
    this.url = '',
    this.size = 0,
  });

  final String url;
  final int size;

  @override
  List<Object?> get props => [url, size];
}