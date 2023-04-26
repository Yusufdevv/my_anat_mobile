part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final FormzStatus orderCreateStatus;
  final int paymentId;
  final FormzStatus checkPaymentStatus;
  final FormzStatus getPricesStatus;
  final FormzStatus payForMonthlyStatus;
  final String status;
  final PaymentType? selectedPayment;
  final PeriodType selectedPeriod;
  final PricesEntity prices;
  const PaymentState({
    required this.selectedPeriod,
    this.paymentId = 0,
    this.orderCreateStatus = FormzStatus.pure,
    this.checkPaymentStatus = FormzStatus.pure,
    this.getPricesStatus = FormzStatus.pure,
    this.payForMonthlyStatus = FormzStatus.pure,
    this.status = '',
    this.selectedPayment,
    this.prices = const PricesEntity(),
  });
  PaymentState copyWith({
    FormzStatus? orderCreateStatus,
    FormzStatus? checkPaymentStatus,
    FormzStatus? getPricesStatus,
    FormzStatus? payForMonthlyStatus,
    PeriodType? selectedPeriod,
    int? paymentIdd,
    String? status,
    PaymentType? selectedPayment,
    PricesEntity? prices,
  }) =>
      PaymentState(
        selectedPeriod: selectedPeriod ?? this.selectedPeriod,
        selectedPayment: selectedPayment ?? this.selectedPayment,
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
        selectedPeriod,
        selectedPayment,
        orderCreateStatus,
        checkPaymentStatus,
        getPricesStatus,
        paymentId,
        status,
        prices,
        payForMonthlyStatus,
      ];
}
