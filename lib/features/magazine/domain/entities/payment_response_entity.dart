import 'package:equatable/equatable.dart';

class PaymentResponseEntity extends Equatable {
  final String transactionCheckoutUrl;
  final int id;
  const PaymentResponseEntity({this.id = 0, this.transactionCheckoutUrl = ''});

  @override
  List<Object?> get props => [
        id,
        transactionCheckoutUrl,
      ];
}
