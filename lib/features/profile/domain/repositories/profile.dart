import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';
import 'package:dio/dio.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  Future<Either<ServerFailure, UserEntity>> getProfile();

  Future<Either<Failure, UserEntity>> editProfile(Map<String, dynamic> data);

  Future<Either<Failure, UserEntity>> uploadImg(FormData formData);
}
