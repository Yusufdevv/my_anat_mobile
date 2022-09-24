import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/domain/repositories/hospital_single_repository.dart';

class DeletePostCommentUseCase extends UseCase<Either, int> {
  final HospitalSingleRepository repository;

  DeletePostCommentUseCase({required this.repository});

  @override
  Future<Either<Failure, Either>> call(int id) async => repository.deleteComment(id: id);
}
