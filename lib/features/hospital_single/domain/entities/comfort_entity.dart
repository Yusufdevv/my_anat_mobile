import 'package:anatomica/features/hospital_single/data/models/icon_model.dart';
import 'package:anatomica/features/hospital_single/domain/entities/icon_entity.dart';

class ComfortEntity {
  @IconConverter()
  final IconEntity icon;
  final int id;
  final String name;
  ComfortEntity({
    this.icon = const IconEntity(),
    this.id = 0,
    this.name = '',
  });
}
