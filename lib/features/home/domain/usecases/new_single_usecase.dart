import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/home/data/models/news_model.dart';
import 'package:anatomica/features/home/data/repository_impls/home_repo_impl.dart';
import 'package:anatomica/features/home/domain/repositories/home_repository.dart';

class NewSingleUseCase implements UseCase<NewsModel, String> {
  final HomeRepository repository = serviceLocator<HomeRepoImpl>();


  NewSingleUseCase( );

  @override
  Future<Either<Failure, NewsModel>> call(String params) async =>
      await repository.getNewSingle(slug: params);
}
