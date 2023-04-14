part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final FormzStatus orderCreateStatus;
  final int paymentId;
  final FormzStatus checkPaymentStatus;
  final FormzStatus getPricesStatus;
  final FormzStatus payForMonthlyStatus;
  final String status;
  final PricesEntity prices;
  const PaymentState({
    this.paymentId = 0,
    this.orderCreateStatus = FormzStatus.pure,
    this.checkPaymentStatus = FormzStatus.pure,
    this.getPricesStatus = FormzStatus.pure,
    this.payForMonthlyStatus = FormzStatus.pure,
    this.status = '',
    this.prices = const PricesEntity(),
  });
  PaymentState copyWith({
    FormzStatus? orderCreateStatus,
    FormzStatus? checkPaymentStatus,
    FormzStatus? getPricesStatus,
    FormzStatus? payForMonthlyStatus,
    int? paymentIdd,
    String? status,
    PricesEntity? prices,
  }) =>
      PaymentState(
        orderCreateStatus: orderCreateStatus ?? this.orderCreateStatus,
        paymentId: paymentIdd ?? this.paymentId,
        checkPaymentStatus: checkPaymentStatus ?? this.checkPaymentStatus,
        getPricesStatus: getPricesStatus ?? this.getPricesStatus,
        status: status ?? this.status,
        prices: prices ?? this.prices,
        payForMonthlyStatus: payForMonthlyStatus ?? this.payForMonthlyStatus,
      );
  @override
  List<Object?> get props => [
        orderCreateStatus,
        checkPaymentStatus,
        getPricesStatus,
        paymentId,
        status,
        prices,
        payForMonthlyStatus,
      ];
}
