import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/journal/data/models/local_journal_model.dart';
import 'package:anatomica/features/journal/domain/entities/local_journal_entity.dart';

abstract class JournalLocalRepository {
  Future<Either<Failure, List<LocalJournalEntity>>> getLocalJournals();
  Future<Either<Failure, void>> addJournalToDb({required LocalJournalModel journal});
}
