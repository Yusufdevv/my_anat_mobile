import 'package:anatomica/core/utils/db_helper.dart';
import 'package:anatomica/features/journal/data/models/local_journal_model.dart';

abstract class JournalLocalDatasource {
  Future<List<LocalJournalModel>> getJournalsFromDb();
  Future<void> addJournalToDb({required LocalJournalModel localJournal});
}

class JournalLocalDatasourceImpl extends JournalLocalDatasource {
  final DbHelper _dbHelper;
  JournalLocalDatasourceImpl(this._dbHelper);
  @override
  Future<void> addJournalToDb({required LocalJournalModel localJournal}) async {
    try {
      await _dbHelper.insert('unregistered_journals', localJournal.toJson());
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<LocalJournalModel>> getJournalsFromDb() async {
    try {
      final journals = await _dbHelper.queryAll('unregistered_journals');
      return journals.map((e) => LocalJournalModel.fromJson(e)).toList();
    } on Exception {
      rethrow;
    }
  }
}
