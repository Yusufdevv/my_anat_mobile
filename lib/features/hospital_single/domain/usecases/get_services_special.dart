import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/data/repository/hospital_repository_impl.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_special_entity.dart';
import 'package:anatomica/features/hospital_single/domain/repositories/hospital_single_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:equatable/equatable.dart';

class GetServicesSpecialUseCase extends UseCase<GenericPagination<HospitalServiceSpecialEntity>, ServiceSpecialParameters> {
  final HospitalSingleRepository repository = serviceLocator<HospitalSingleRepositoryImpl>();
  GetServicesSpecialUseCase();
  @override
  Future<Either<Failure, GenericPagination<HospitalServiceSpecialEntity>>> call(ServiceSpecialParameters params) async =>
      await repository.getHospitalServicesSpecial(orgId: params.orgId, next: params.next, search: params.query);
}

class ServiceSpecialParameters extends Equatable {
  final String query;
  final String? next;
  final int orgId;

  const ServiceSpecialParameters({
    required this.orgId,
    this.query = '',
    this.next,
  });

  @override
  List<Object?> get props => [query, next, orgId, ];
}
