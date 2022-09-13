import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/data/repository/global_requst_repository.dart';
import 'package:anatomica/features/hospital_single/data/models/hospital_model.dart';

class GetSingleHospitalUseCase extends UseCase<HospitalModel, String> {
  final GlobalRequestRepository repository = GlobalRequestRepository();

  @override
  Future<Either<Failure, HospitalModel>> call(String slug) async {
    return await repository.getSingle<HospitalModel>(
        endpoint: '/organization/$slug/detail/', fromJson: HospitalModel.fromJson);
  }
}
