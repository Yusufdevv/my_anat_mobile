import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';
import 'package:anatomica/features/profile/data/datasources/profile_data_source.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';
import 'package:dio/dio.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDatasourceImpl profileDatasource;

  const ProfileRepositoryImpl({required this.profileDatasource});

  @override
  Future<Either<ServerFailure, UserEntity>> getProfile() async =>
      await _getProfile();

  Future<Either<ServerFailure, UserEntity>> _getProfile() async {
    try {
      final result = await profileDatasource.getProfile();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          errorMessage: error.errorMessage, statusCode: error.statusCode));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> editProfile(
      Map<String, dynamic> data) async {
    try {
      final result = await profileDatasource.editProfile(data);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          errorMessage: error.errorMessage, statusCode: error.statusCode));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> uploadImg(FormData formData) async {
    try {
      final result = await profileDatasource.uploadImg(formData);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          errorMessage: error.errorMessage, statusCode: error.statusCode));
    }
  }
}
