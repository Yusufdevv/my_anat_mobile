import 'package:anatomica/features/home/domain/entities/icon_entity.dart';
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String title;
  @IconConverter()
  final IconEntity icon;

  const CategoryEntity({
    this.id = 0,
    this.title = '',
    this.icon = const IconEntity(),
  });

  @override
  List<Object?> get props => [
        id,
        title,
        icon
      ];
}
