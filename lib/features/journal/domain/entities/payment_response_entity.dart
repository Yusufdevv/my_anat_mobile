import 'package:equatable/equatable.dart';

class PaymentResponseEntity extends Equatable {
  final String transactionCheckoutUrl;
  final int id;
  final String status;
  const PaymentResponseEntity({
    this.id = -1,
    this.transactionCheckoutUrl = '',
    this.status = '',
  });

  @override
  List<Object?> get props => [
        id,
        transactionCheckoutUrl,
        status,
      ];
}
