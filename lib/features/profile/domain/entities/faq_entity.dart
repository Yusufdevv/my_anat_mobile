import 'package:equatable/equatable.dart';

class FaqEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  const FaqEntity({this.title = '', this.id = 0, this.description = ''});
  @override
  List<Object?> get props => [id, title, description];
}
