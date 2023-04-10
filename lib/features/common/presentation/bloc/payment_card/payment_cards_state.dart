part of 'payment_cards_bloc.dart';

@immutable
class PaymentCardsState {
  final List<PaymentCardEntity> paymentCards;
  final PaymentCardEntity? selectedCard;
  final FormzStatus status;
  final FormzStatus secondStatus;
  final CreateCardResponseModel? createCardResponseModel;

  const PaymentCardsState({
    required this.paymentCards,
    this.selectedCard,
    required this.status,
    required this.secondStatus,
    this.createCardResponseModel,
  });

  const PaymentCardsState.empty([
    this.paymentCards = const <PaymentCardEntity>[],
    this.createCardResponseModel,
    this.status = FormzStatus.pure,
    this.secondStatus = FormzStatus.pure,
    this.selectedCard,
  ]);

  PaymentCardsState copyWith({
    List<PaymentCardEntity>? paymentCards,
    FormzStatus? status,
    FormzStatus? secondStatus,
    PaymentCardEntity? selectedCard,
    CreateCardResponseModel? createCardResponseModel,
  }) =>
      PaymentCardsState(
        paymentCards: paymentCards ?? this.paymentCards,
        status: status ?? this.status,
        secondStatus: secondStatus ?? this.secondStatus,
        selectedCard: selectedCard ?? this.selectedCard,
        createCardResponseModel: createCardResponseModel ?? this.createCardResponseModel,
      );

  List<Object?> get props => [
        paymentCards,
        status,
        secondStatus,
        selectedCard,
        createCardResponseModel,
      ];
}
