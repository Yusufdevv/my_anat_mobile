import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/journal/domain/entities/prices_entity.dart';
import 'package:anatomica/features/journal/domain/repositories/payment_repository.dart';

class GetPricesUseCase implements UseCase<PricesEntity, NoParams> {
  final PaymentRepository repository;
  GetPricesUseCase({required this.repository});
  @override
  Future<Either<Failure, PricesEntity>> call(NoParams params) async => await repository.getPrices();
}
