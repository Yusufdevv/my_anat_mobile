import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/markdown_reader/domain/entities/journal_page_entity.dart';
import 'package:anatomica/features/markdown_reader/domain/repositories/journal_pages_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class GetJournalPagesUseCase implements UseCase<GenericPagination<JournalPageEntity>, JournalPagesParams> {
  final JournalPagesRepository repository;
  GetJournalPagesUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<JournalPageEntity>>> call(JournalPagesParams params) async =>
      await repository.getJournalPages(slug: params.slug, next: params.next);
}

class JournalPagesParams {
  final String? next;
  final String slug;
  const JournalPagesParams({this.next, required this.slug});
}
