import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/doctor_single/domain/repositories/doctor_single_repository.dart';

class DoctorCommentDeleteUseCase extends UseCase<String, int> {
  final DoctorSingleRepository repository;

  DoctorCommentDeleteUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(int id) async =>
      await repository.deleteDoctorComment(id: id);
}
