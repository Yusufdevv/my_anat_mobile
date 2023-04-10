part of 'payment_cards_bloc.dart';

@immutable
abstract class PaymentCardsEvent {}

class GetPaymentCardsEvent extends PaymentCardsEvent {}

class CreatePaymentCardEvent extends PaymentCardsEvent {
  final CreateCardParam param;
  final Function() onSucces;
  final Function(String) onError;

  CreatePaymentCardEvent({
    required this.param,
    required this.onSucces,
    required this.onError,
  });
}

class ConfirmPaymentCardEvent extends PaymentCardsEvent {
  final ConfirmCardParam param;
  final Function() onSucces;
  final Function(String) onError;

  ConfirmPaymentCardEvent({
    required this.param,
    required this.onSucces,
    required this.onError,
  });
}

class SetSelectedPaymentCardEvent extends PaymentCardsEvent {
  final int id;

  SetSelectedPaymentCardEvent({
    required this.id,
  });
}
class DeletePaymentCard extends PaymentCardsEvent {
  final int id;
  final Function() onSucces;
  final Function(String) onError;

  DeletePaymentCard({
    required this.id,
    required this.onSucces,
    required this.onError,
  });
}