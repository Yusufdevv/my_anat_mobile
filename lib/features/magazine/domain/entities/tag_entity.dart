import 'package:equatable/equatable.dart';

class TagEntity extends Equatable {
  final String title;
  final int id;
  const TagEntity({required this.title, required this.id});
  @override
  List<Object?> get props => [
        title,
        id,
      ];
}
