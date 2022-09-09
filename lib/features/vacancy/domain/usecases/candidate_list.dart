import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';
import 'package:equatable/equatable.dart';

class CandidateListUseCase
    extends UseCase<GenericPagination<CandidateListEntity>, CandidateListParams> {
  final VacancyRepository repository;

  CandidateListUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<CandidateListEntity>>> call(
          CandidateListParams params) async =>
      await repository.getCandidateList(
          next: params.next, search: params.search, categoryId: params.categoryId);
}

class CandidateListParams extends Equatable {
  final String? next;
  final String? search;
  final String? categoryId;

  const CandidateListParams({this.categoryId, this.search, this.next});

  @override
  List<Object?> get props => [next, search, categoryId];
}
