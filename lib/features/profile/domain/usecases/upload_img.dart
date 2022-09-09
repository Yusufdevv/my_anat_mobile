import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/profile/domain/entities/uploaded_image_entity.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';
import 'package:dio/dio.dart';

class UploadImageUseCase extends UseCase<UploadedImageEntity, FormData> {
  final ProfileRepository profileRepository;

  UploadImageUseCase({required this.profileRepository});

  @override
  Future<Either<Failure, UploadedImageEntity>> call(FormData formData) async {
    return await profileRepository.uploadImg(formData);
  }
}
