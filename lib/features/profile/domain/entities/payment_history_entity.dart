import 'package:equatable/equatable.dart';

class PaymentHistoryEntity extends Equatable {
  const PaymentHistoryEntity({
    this.id = -1,
    this.purpose = '',
    this.description = '',
    this.status = '',
    this.amount = 0,
    this.createdAt = '',
    this.transactionId = '',
    this.provider = '',
    this.products = const [],
    this.monthCount = 0,
    this.payedAt = '',
  });

  final int id;
  final String purpose;
  final String description;
  final String status;
  final int amount;
  final String createdAt;
  final String transactionId;
  final String provider;
  final List<String> products;
  final int monthCount;
  final String payedAt;

  @override
  List<Object?> get props => [
        id,
        purpose,
        description,
        status,
        amount,
        createdAt,
        transactionId,
        products,
        provider,
        monthCount,
        payedAt,
      ];
}
