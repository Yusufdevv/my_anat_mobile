part of 'payment_cards_bloc.dart';

@immutable
class PaymentCardsState {
  final List<PaymentCardEntity> paymentCards;
  final PaymentCardEntity? selectedCard;
  final FormzStatus status;
  final FormzStatus secondStatus;

  const PaymentCardsState({
    required this.paymentCards,
    this.selectedCard,
    required this.status,
    required this.secondStatus,
  });

  const PaymentCardsState.empty([
    this.paymentCards = const <PaymentCardEntity>[],
    this.status = FormzStatus.pure,
    this.secondStatus = FormzStatus.pure,
    this.selectedCard,
  ]);

  PaymentCardsState copyWith({
    List<PaymentCardEntity>? paymentCards,
    FormzStatus? status,
    FormzStatus? secondStatus,
    PaymentCardEntity? selectedCard,
  }) =>
      PaymentCardsState(
        paymentCards: paymentCards ?? this.paymentCards,
        status: status ?? this.status,
        secondStatus: secondStatus ?? this.secondStatus,
        selectedCard: selectedCard ?? this.selectedCard,
      );

  List<Object?> get props => [
        paymentCards,
        status,
        secondStatus,
        selectedCard,
      ];
}
