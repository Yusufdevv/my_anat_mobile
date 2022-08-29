import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/repository/global_requst_repository.dart';
import 'package:anatomica/features/hospital_single/data/models/hospital_model.dart';
import 'package:anatomica/features/hospital_single/data/repository/hospital_repository.dart';

class GetSingleHospitalUseCase extends UseCase<HospitalModel, String> {
  final GlobalRequestRepopsitory repository = GlobalRequestRepopsitory();

  @override
  Future<Either<Failure, HospitalModel>> call(String slug) async {
    return await repository.getSingle<HospitalModel>(
        endpoint: '/organization/$slug/detail/',
        fromJson: HospitalModel.fromJson);
  }
}
