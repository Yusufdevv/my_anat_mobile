import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/journal/domain/entities/journal_entity.dart';
import 'package:anatomica/features/journal/domain/repositories/journal_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class GetJournalUseCase implements UseCase<GenericPagination<JournalEntity>, String?> {
  final JournalRepository repository;
  GetJournalUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<JournalEntity>>> call(String? params) =>
      repository.getJournals(next: params);
}
