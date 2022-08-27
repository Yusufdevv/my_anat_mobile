import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';

class GetProfileUseCase extends UseCase<UserEntity, NoParams> {
  final ProfileRepository profileRepository;

  GetProfileUseCase({required this.profileRepository});

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await profileRepository.getProfile();
  }
}
