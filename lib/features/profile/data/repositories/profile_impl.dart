import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/profile/data/datasources/profile_data_source.dart';
import 'package:anatomica/features/profile/domain/entities/faq_entity.dart';
import 'package:anatomica/features/profile/domain/entities/uploaded_image_entity.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';
import 'package:dio/dio.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDatasource profileDatasource;

  const ProfileRepositoryImpl({required this.profileDatasource});

  @override
  Future<Either<Failure, UserEntity>> getProfile() async => await _getProfile();

  Future<Either<Failure, UserEntity>> _getProfile() async {
    try {
      final result = await profileDatasource.getProfile();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> editProfile(Map<String, dynamic> data) async {
    try {
      await profileDatasource.editProfile(data);
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
  Future<Either<Failure, UploadedImageEntity>> uploadImg(FormData formData) async {
    try {
      final result = await profileDatasource.uploadImg(formData);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword({required String currentPassword, required String newPassword}) async {
    try {
      await profileDatasource.changePassword(currentPassword: currentPassword, newPassword: newPassword);
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
  Future<Either<Failure, void>> deleteAccount() async {
    try {
      await profileDatasource.deleteAccount();
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
  Future<Either<Failure, GenericPagination<FaqEntity>>> getFaq({String? next}) async {
    try {
      final result = await profileDatasource.getFaq(next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
