import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/domain/entities/certificate.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';

class CandidateCertificateUseCase
    extends UseCase<GenericPagination<CertificateEntity>, int> {
  final VacancyRepository repository;

  CandidateCertificateUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<CertificateEntity>>> call(
          int params) async =>
      await repository.getCandidateCertificate(id: params);
}
