import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/home/data/models/banner_model.dart';
import 'package:anatomica/features/home/data/repository_impls/home_repo_impl.dart';
import 'package:anatomica/features/home/domain/repositories/home_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class BannerSingleUsecase implements UseCase<BannerModel, int> {
  final HomeRepository repository = serviceLocator<HomeRepoImpl>();

  BannerSingleUsecase();

  @override
  Future<Either<Failure, BannerModel>> call(int params) async =>
      await repository.getBannerSingle(id: params);
}
