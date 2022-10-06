import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/journal/domain/entities/local_journal_entity.dart';
import 'package:anatomica/features/journal/domain/repositories/journal_local_repository.dart';

class GetJournalsFromDbUseCase implements UseCase<List<LocalJournalEntity>, NoParams> {
  final JournalLocalRepository repository;
  GetJournalsFromDbUseCase({required this.repository});
  @override
  Future<Either<Failure, List<LocalJournalEntity>>> call(NoParams params) async => await repository.getLocalJournals();
}
