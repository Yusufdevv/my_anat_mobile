import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';

class EditProfileUseCase extends UseCase<void, EditProfileParams> {
  final ProfileRepository repository;

  EditProfileUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(params) async {
    print('call edit profile usecase');
    return await repository.editProfile(params.data);
  }
}

class EditProfileParams {
  final Map<String, dynamic> data;

  const EditProfileParams({required this.data});
}
