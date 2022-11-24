import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/markdown_reader/domain/entities/journal_outline_entity.dart';
import 'package:anatomica/features/markdown_reader/domain/repositories/journal_pages_repository.dart';
import 'package:anatomica/features/markdown_reader/domain/usecases/get_journal_pages_usecase.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class GetJournalContentsUseCase implements UseCase<GenericPagination<JournalOutlineEntity>, JournalPagesParams> {
  final JournalPagesRepository repository;
  GetJournalContentsUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<JournalOutlineEntity>>> call(JournalPagesParams params) async =>
      await repository.getPagesTableOfContents(slug: params.slug, next: params.next);
}
