part of 'payment_card_bloc.dart';

@immutable
class PaymentCardState {
  final List<PaymentCardEntity> paymentCards;
  final FormzStatus status;
  final FormzStatus secondStatus;

  const PaymentCardState(
      {required this.paymentCards,
      required this.status,
      required this.secondStatus});

  const PaymentCardState.empty([
    this.paymentCards = const <PaymentCardEntity>[],
    this.status = FormzStatus.pure,
    this.secondStatus = FormzStatus.pure,
  ]);

  PaymentCardState copyWith({
    List<PaymentCardEntity>? paymentCards,
    FormzStatus? status,
    FormzStatus? secondStatus,
  }) =>
      PaymentCardState(
        paymentCards: paymentCards ?? this.paymentCards,
        status: status ?? this.status,
        secondStatus: secondStatus ?? this.secondStatus,
      );

  List<Object?> get props => [
        paymentCards,
        status,
        secondStatus,
      ];
}
