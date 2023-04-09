part of 'payment_card_bloc.dart';

@immutable
abstract class PaymentCardEvent {}

class GetPaymentCardsEvent extends PaymentCardEvent {}

class CreatePaymentCardEvent extends PaymentCardEvent {
  final CreateCardParam param;
  final Function() onSucces;
  final Function(String) onError;

  CreatePaymentCardEvent({
    required this.param,
    required this.onSucces,
    required this.onError,
  });
}

class ConfirmPaymentCardEvent extends PaymentCardEvent {
  final ConfirmCardParam param;
  final Function() onSucces;
  final Function(String) onError;

  ConfirmPaymentCardEvent({
    required this.param,
    required this.onSucces,
    required this.onError,
  });
}

class DeletePaymentCard extends PaymentCardEvent {
  final int id;
  final Function() onSucces;
  final Function(String) onError;

  DeletePaymentCard({
    required this.id,
    required this.onSucces,
    required this.onError,
  });
}
