import 'package:anatomica/features/journal/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class PaymentHistoryEntity extends Equatable {
  const PaymentHistoryEntity({
    this.id = -1,
    this.amount = 0,
    this.createdAt = '',
    this.product = const [],
    this.payedAt = '',
  });

  final int id;
  final int amount;
  final String createdAt;
  @ProductConverter()
  final List<ProductEntity> product;
  final String payedAt;

  @override
  List<Object?> get props => [
        id,
        amount,
        createdAt,
        payedAt,
      ];
}
