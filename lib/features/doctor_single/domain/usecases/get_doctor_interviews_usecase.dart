import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/doctor_single/domain/entities/doctor_interview_entity.dart';
import 'package:anatomica/features/doctor_single/domain/repositories/doctor_single_repository.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class GetDoctorInterviewsUseCase implements UseCase<GenericPagination<DoctorInterviewEntity>, TypeParameter> {
  final DoctorSingleRepository repository;
  GetDoctorInterviewsUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<DoctorInterviewEntity>>> call(TypeParameter params) async =>
      await repository.getDoctorInterviews(id: params.id, next: params.next);
}
