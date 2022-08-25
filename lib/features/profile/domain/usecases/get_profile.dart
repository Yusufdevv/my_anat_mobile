import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/profile/domain/entities/profile_entity.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';

class GetProfileUseCase extends UseCase<ProfileEntity, NoParams> {
  final ProfileRepository profileRepository;

  GetProfileUseCase({required this.profileRepository});

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) async {
    return await profileRepository.getProfile();
  }
}
