import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/data/repository/hospital_repository_impl.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_entity.dart';
import 'package:anatomica/features/hospital_single/domain/repositories/hospital_single_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:equatable/equatable.dart';

class GetServicesUseCase extends UseCase<GenericPagination<HospitalServiceEntity>, ServiceParameters> {
  final HospitalSingleRepository repository = serviceLocator<HospitalSingleRepositoryImpl>();
  GetServicesUseCase( );
  @override
  Future<Either<Failure, GenericPagination<HospitalServiceEntity>>> call(ServiceParameters params) async =>
      await repository.getHospitalServicesOrg(orgId: params.orgId, next: params.next, search: params.query, specId: params.specId);
}

class ServiceParameters extends Equatable {
  final String query;
  final String? next;
  final int orgId;
  final int specId;

  const ServiceParameters({
    required this.orgId,
    required  this.specId,
    this.query = '',
    this.next,
  });

  @override
  List<Object?> get props => [query, next, orgId, specId];
}
