import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/journal/domain/entities/journal_entity.dart';
import 'package:anatomica/features/journal/domain/repositories/journal_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:equatable/equatable.dart';

class SearchJournalUseCase implements UseCase<GenericPagination<JournalEntity>, SearchParams> {
  final JournalRepository repository;
  SearchJournalUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<JournalEntity>>> call(SearchParams params) =>
      repository.searchJournals(query: params.query, next: params.next);
}

class SearchParams extends Equatable {
  final String query;
  final String? next;
  const SearchParams({required this.query, this.next});
  @override
  List<Object?> get props => [
        query,
        next,
      ];
}
