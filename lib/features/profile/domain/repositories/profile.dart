import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  const ProfileRepository();
  Future<Either<ServerFailure, ProfileEntity>> getProfile();
}
