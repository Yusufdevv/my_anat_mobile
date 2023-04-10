import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/profile/data/datasources/profile_data_source.dart';
import 'package:anatomica/features/profile/data/models/payment_history_model.dart';
import 'package:anatomica/features/profile/domain/entities/faq_entity.dart';
import 'package:anatomica/features/profile/domain/entities/uploaded_image_entity.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
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
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
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
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, UploadedImageEntity>> uploadImg(
      FormData formData) async {
    try {
      final result = await profileDatasource.uploadImg(formData);
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
  Future<Either<Failure, GenericPagination<PaymentHistoryModel>>>
      getMyPayments({
    String? next,
    String? search,
    String? provider,
    String? purpose,
    String? status,
  }) async {
    try {
      final result = await profileDatasource.getMyPayments(
          next: next,
          search: search,
          provider: provider,
          purpose: purpose,
          status: status);
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
  Future<Either<Failure, void>> changePassword(
      {required String currentPassword, required String newPassword}) async {
    try {
      await profileDatasource.changePassword(
          currentPassword: currentPassword, newPassword: newPassword);
      return Right('');
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
  Future<Either<Failure, void>> deleteAccount() async {
    try {
      await profileDatasource.deleteAccount();
      return Right('');
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
  Future<Either<Failure, GenericPagination<FaqEntity>>> getFaq(
      {String? next}) async {
    try {
      final result = await profileDatasource.getFaq(next: next);
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
  Future<Either<Failure, GenericPagination<CandidateListEntity>>>
      getLikedCandidate({String? next}) async {
    try {
      final result = await profileDatasource.getLikedCandidateList(next: next);
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
  Future<Either<Failure, GenericPagination<VacancyListEntity>>> getLikedVacancy(
      {String? next}) async {
    try {
      final result = await profileDatasource.getLikedVacancyList(next: next);
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
  Future<Either<Failure, String>> sendCodeToEmail(
      {required String email}) async {
    try {
      final result = await profileDatasource.sendCodeToEmail(email: email);
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
  Future<Either<Failure, String>> sendCodeToPhone(
      {required String phone}) async {
    try {
      final result =
          await profileDatasource.sendCodeToPhone(phoneNumber: phone);
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
