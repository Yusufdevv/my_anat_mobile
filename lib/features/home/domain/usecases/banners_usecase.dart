import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/home/data/models/banner_model.dart';
import 'package:anatomica/features/home/domain/repositories/home_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class BannersUsecase
    implements UseCase<GenericPagination<BannerModel>, String?> {
  final HomeRepository repository;

  BannersUsecase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<BannerModel>>> call(
          String? params) async =>
      await repository.getBanners(next: params);
}
