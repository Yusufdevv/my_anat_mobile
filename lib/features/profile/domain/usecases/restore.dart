import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/data/repository/global_requst_repository.dart';

class RestoreUseCase extends UseCase<String, RestoreParam> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, String>> call(RestoreParam param) {
    print(param.signature);
    print(param.isArticle);
    return repo.postAndSingle(
        endpoint: param.isArticle ? '/article/restore/' : '/journal/restore/',
        fromJson: (data) => '',
        data: {
          "signature": param.signature,
          "phone":param.phone
        });
  }
}

class RestoreParam {
  final bool isArticle;
  final String signature;
  final String phone;

  RestoreParam({required this.signature, required this.isArticle,required this.phone});
}
