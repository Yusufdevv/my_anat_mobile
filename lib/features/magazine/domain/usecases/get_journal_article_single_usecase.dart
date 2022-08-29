import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/magazine/domain/entities/journal_article_single.dart';
import 'package:anatomica/features/magazine/domain/repositories/journal_repository.dart';

class GetJournalArticleSingleUseCase implements UseCase<JournalArticleSingleEntity, String> {
  final JournalRepository repository;
  GetJournalArticleSingleUseCase({required this.repository});
  @override
  Future<Either<Failure, JournalArticleSingleEntity>> call(String params) async =>
      repository.getJournalArticleSingle(slug: params);
}
