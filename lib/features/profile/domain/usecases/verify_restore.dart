import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/data/repository/global_requst_repository.dart';

class VerifyRestoreCode extends UseCase<String, VerifyParam> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, String>> call(VerifyParam param) {
    return repo.postAndSingle(errorFieldKey: 'code',
        endpoint: '/confirmation/code/verify/',
        fromJson: (data) {
          return data['signature'];
        },
        data: {
          "type": "phone",
          "signature": param.signature,
          "code": param.code,
          "phone": param.phone,
          "email": ""
        });
  }
}

class VerifyParam {
  final String code;

  final String signature;
  final String phone;

  VerifyParam(
      {required this.code, required this.signature, required this.phone});
}
