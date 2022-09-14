part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class OrderCreateArticle extends PaymentEvent {
  final int articleId;
  final int price;
  final String phone;
  final String email;
  final String paymentProvider;
  final bool isRegistered;
  final ValueChanged<String> onSuccess;
  final ValueChanged<String> onError;
  OrderCreateArticle({
    required this.articleId,
    required this.price,
    required this.phone,
    required this.email,
    required this.paymentProvider,
    required this.onSuccess,
    required this.onError,
    required this.isRegistered,
  });
}

class OrderCreateJournal extends PaymentEvent {
  final int journalId;
  final int price;
  final String phone;
  final String email;
  final String paymentProvider;
  final bool isRegistered;
  final ValueChanged<String> onSuccess;
  final ValueChanged<String> onError;
  OrderCreateJournal({
    required this.journalId,
    required this.price,
    required this.phone,
    required this.email,
    required this.paymentProvider,
    required this.onSuccess,
    required this.onError,
    required this.isRegistered,
  });
}

class CheckPaymentStatus extends PaymentEvent {}
