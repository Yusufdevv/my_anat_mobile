import 'package:anatomica/features/markdown_reader/data/models/journal_page_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

abstract class JournalPagesDatasource {
  Future<GenericPagination<JournalPageModel>> getPages({required String slug});
}
