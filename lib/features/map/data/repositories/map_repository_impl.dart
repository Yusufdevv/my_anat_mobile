import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/entities/type_entity.dart';
import 'package:anatomica/features/map/data/datasources/map_datasource.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/map/data/models/service_spec_suggest_model.dart';
import 'package:anatomica/features/map/domain/repositories/map_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:equatable/equatable.dart';

class MapRepositoryImpl extends MapRepository {
  final MapDatasource datasource;
  MapRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, GenericPagination<TypeEntity>>> getTypes(
      {String? next}) async {
    try {
      final result = await datasource.getTypes(next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<ServiceSpecSuggestModel>>> getServices(
      {String? searchText}) async {
    try {
      final result = await datasource.getServices(searchedText: searchText);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<OrgMapV2Model>>> getOrgMapV2(
      {required MapV2Params v2params}) async {
    try {
      final result = await datasource.getOrgV2(params: v2params);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}

class MapV2Params extends Equatable {
  final String? search;
  final String? region;
  final String? district;
  final int? specializationId;
  final String? service;
  final int? limit;
  final int? offset;
  final double? latitude;
  final double? longitude;
  final String? title;
  final String? next;
  final String? previous;

  const MapV2Params({
    this.title,
    this.longitude,
    this.latitude,
    this.region,
    this.district,
    this.search,
    this.service,
    this.offset,
    this.limit,
    this.specializationId,
    this.next,
    this.previous,
  });
  @override
  List<Object?> get props => [
        title,
        longitude,
        latitude,
        region,
        district,
        search,
        service,
        offset,
        limit,
        specializationId,
      ];
}
