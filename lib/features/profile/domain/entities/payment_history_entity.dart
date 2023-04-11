import 'package:equatable/equatable.dart';

class PaymentHistoryEntity extends Equatable {
  const PaymentHistoryEntity({
    this.id = -1,
    this.amount = 0,
    this.createdAt = '',
    this.product = '',
    this.payedAt = '',
  });

  final int id;
  final int amount;
  final String createdAt;
  final String product;
  final String payedAt;

  @override
  List<Object?> get props => [
        id,
        amount,
        createdAt,
        payedAt,
      ];
}
