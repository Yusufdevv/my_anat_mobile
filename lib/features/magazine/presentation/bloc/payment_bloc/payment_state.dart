part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final FormzStatus orderCreateStatus;
  final int paymentId;
  final FormzStatus checkPaymentStatus;
  final String status;
  const PaymentState({
    this.paymentId = 0,
    this.orderCreateStatus = FormzStatus.pure,
    this.checkPaymentStatus = FormzStatus.pure,
    this.status = '',
  });
  PaymentState copyWith({
    FormzStatus? orderCreateStatus,
    FormzStatus? checkPaymentStatus,
    int? paymentId,
    String? status,
  }) =>
      PaymentState(
        orderCreateStatus: orderCreateStatus ?? this.orderCreateStatus,
        paymentId: paymentId ?? this.paymentId,
        checkPaymentStatus: checkPaymentStatus ?? this.checkPaymentStatus,
        status: status ?? this.status,
      );
  @override
  List<Object?> get props => [
        orderCreateStatus,
        checkPaymentStatus,
        paymentId,
        status,
      ];
}
