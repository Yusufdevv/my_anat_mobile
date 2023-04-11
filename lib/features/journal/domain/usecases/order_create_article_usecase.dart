import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/journal/domain/entities/payment_response_entity.dart';
import 'package:anatomica/features/journal/domain/repositories/payment_repository.dart';
import 'package:equatable/equatable.dart';

class OrderCreateArticleUseCase implements UseCase<PaymentResponseEntity, OrderCreateParams> {
  final PaymentRepository repository;

  OrderCreateArticleUseCase({required this.repository});

  @override
  Future<Either<Failure, PaymentResponseEntity>> call(OrderCreateParams params) async => repository.orderCreateArticle(
        articleId: params.id,
        price: params.price,
        phoneNumber: params.phoneNumber,
        email: params.email,
        paymentProvider: params.paymentProvider,
        isRegistered: params.isRegistered,
        card: params.card,
      );
}

class OrderCreateParams extends Equatable {
  final int id;
  final int price;
  final String phoneNumber;
  final String email;
  final String paymentProvider;
  final bool isRegistered;
  final int card;

  const OrderCreateParams({
    required this.id,
    required this.price,
    required this.phoneNumber,
    required this.email,
    required this.paymentProvider,
    required this.isRegistered,
    required this.card,
  });

  @override
  List<Object?> get props => [id, price, phoneNumber, email, paymentProvider, isRegistered, card];
}
