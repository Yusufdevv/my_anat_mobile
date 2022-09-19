import 'package:anatomica/features/hospital_single/data/models/file_model.dart';
import 'package:anatomica/features/hospital_single/domain/entities/file_entity.dart';

class IconEntity {
  final int id;
  final String title;
  final String slug;
  @FileConverter()
  final FileEntity file;
  const IconEntity({
    this.id = 0,
    this.slug = '',
    this.title = '',
    this.file = const FileEntity(),
  });
}
