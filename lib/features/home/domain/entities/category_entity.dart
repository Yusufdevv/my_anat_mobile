import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String title;
  final String icon;

  const CategoryEntity({
    this.id = 0,
    this.title = '',
    this.icon = '',
  });

  @override
  List<Object?> get props => [
        id,
        title,
      ];
}
