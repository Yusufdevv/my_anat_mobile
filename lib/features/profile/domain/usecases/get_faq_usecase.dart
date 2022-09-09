import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/profile/domain/entities/faq_entity.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';

class GetFaqUseCase implements UseCase<GenericPagination<FaqEntity>, String?> {
  final ProfileRepository repository;
  GetFaqUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<FaqEntity>>> call(String? params) async =>
      await repository.getFaq(next: params);
}
