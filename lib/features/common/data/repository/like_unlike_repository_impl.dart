import 'dart:async';

import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/data/datasources/like_unlike_datasource.dart';
import 'package:anatomica/features/common/domain/repositories/like_unlike_repository.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';

class LikeUnlikeRepositoryImpl extends LikeUnlikeRepository {
  final LikeUnlikeDatasource datasource;

  LikeUnlikeRepositoryImpl({required this.datasource});

  final StreamController<VacancyListEntity> _vacancyController = StreamController.broadcast(sync: true);
  final StreamController<CandidateListEntity> _doctorController = StreamController.broadcast(sync: true);

  @override
  Future<Either<Failure, void>> likeDoctor(CandidateListEntity doctor) async {
    try {
      await datasource.likeDoctor(doctor.id);
      _doctorController.add(doctor.copyWith(isFavorite: true));
      return Right('');
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Stream<CandidateListEntity> likeUnlikeDoctorStream() async* {
    yield* _doctorController.stream;
  }

  @override
  Stream<VacancyListEntity> likeUnlikeVacancyStream() async* {
    yield* _vacancyController.stream;
  }

  @override
  Future<Either<Failure, void>> likeVacancy(VacancyListEntity vacancy) async {
    try {
      await datasource.likeVacancy(vacancy.id);
      _vacancyController.add(vacancy.copyWith(isFavorite: true));
      return Right('');
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> unlikeDoctor(CandidateListEntity doctor) async {
    try {
      await datasource.unlikeDoctor(doctor.id);
      _doctorController.add(doctor.copyWith(isFavorite: false));
      return Right('');
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> unlikeVacancy(VacancyListEntity vacancy) async {
    try {
      await datasource.unlikeVacancy(vacancy.id);
      _vacancyController.add(vacancy.copyWith(isFavorite: false));
      return Right('');
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
