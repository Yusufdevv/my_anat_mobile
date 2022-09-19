import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_entity.dart';
import 'package:anatomica/features/hospital_single/domain/repositories/hospital_single_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:equatable/equatable.dart';

class GetServicesUseCase extends UseCase<GenericPagination<HospitalServiceEntity>, ServiceParameters> {
  final HospitalSingleRepository repository;
  GetServicesUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<HospitalServiceEntity>>> call(ServiceParameters params) async =>
      await repository.getHospitalServices(id: params.id, next: params.next, search: params.query);
}

class ServiceParameters extends Equatable {
  final String query;
  final String? next;
  final int id;
  const ServiceParameters({
    required this.id,
    this.query = '',
    this.next,
  });

  @override
  List<Object?> get props => [query, next, id];
}
