import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/journal/data/datasources/journal_local_datasource.dart';
import 'package:anatomica/features/journal/data/models/local_journal_model.dart';
import 'package:anatomica/features/journal/domain/entities/local_journal_entity.dart';
import 'package:anatomica/features/journal/domain/repositories/journal_local_repository.dart';

class JournalLocalRepositoryImpl extends JournalLocalRepository {
  final JournalLocalDatasource datasource;
  JournalLocalRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, void>> addJournalToDb({required LocalJournalModel journal}) async {
    try {
      await datasource.addJournalToDb(localJournal: journal);
      return Right('');
    } on Exception catch (e) {
      return Left(ParsingFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LocalJournalEntity>>> getLocalJournals() async {
    try {
      final books = await datasource.getJournalsFromDb();
      return Right(books);
    } on Exception catch (e) {
      return Left(ParsingFailure(errorMessage: e.toString()));
    }
  }
}
