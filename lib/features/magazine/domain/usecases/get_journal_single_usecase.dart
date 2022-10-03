import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/magazine/domain/entities/journal_single_entity.dart';
import 'package:anatomica/features/magazine/domain/repositories/journal_repository.dart';

class GetJournalSingleUseCase implements UseCase<JournalSingleEntity, String> {
  final JournalRepository repository;
  GetJournalSingleUseCase({required this.repository});
  @override
  Future<Either<Failure, JournalSingleEntity>> call(String params) async => repository.getJournalSingle(slug: params);
}
