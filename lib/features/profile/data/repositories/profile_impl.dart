import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/profile/data/datasources/profile_data_source.dart';
import 'package:anatomica/features/profile/domain/entities/profile_entity.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDatasource profileDatasource;

  const ProfileRepositoryImpl({required this.profileDatasource});

  @override
  Future<Either<ServerFailure, ProfileEntity>> getProfile() => _getProfile();

  Future<Either<ServerFailure, ProfileEntity>> _getProfile() async {
    try {
      final result = await profileDatasource.getProfile('');
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          errorMessage: error.errorMessage, statusCode: error.statusCode));
    }
  }
}
