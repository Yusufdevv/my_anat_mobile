import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/data/repository/global_requst_repository.dart';

class SendRestoreCode extends UseCase<String, String> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, String>> call(String params) {
    return repo.postAndSingle(
        endpoint: '/confirmation/code/send/',
        fromJson: (data) {
          return data['signature'];
        },
        data: {"phone": params, "type": "phone", "email": ""});
  }
}
