part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final FormzStatus orderCreateStatus;
  const PaymentState({this.orderCreateStatus = FormzStatus.pure});
  @override
  List<Object?> get props => [orderCreateStatus];
}
