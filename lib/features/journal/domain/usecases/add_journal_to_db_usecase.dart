import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/journal/data/models/local_journal_model.dart';
import 'package:anatomica/features/journal/domain/repositories/journal_local_repository.dart';

class AddJournalToDbUseCase implements UseCase<void, LocalJournalModel> {
  final JournalLocalRepository repository;
  AddJournalToDbUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(LocalJournalModel params) async =>
      await repository.addJournalToDb(journal: params);
}
