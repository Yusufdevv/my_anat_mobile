import 'package:anatomica/features/journal/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:anatomica/features/journal/presentation/pages/payment_failure.dart';
import 'package:anatomica/features/journal/presentation/pages/payment_success.dart';
import 'package:anatomica/features/journal/presentation/pages/payment_waiting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentResultScreen extends StatelessWidget {
  final PaymentBloc bloc;
  final bool isSubscription;
  final String title;
  final bool isRegistered;
  const PaymentResultScreen({
    required this.bloc,
    required this.isRegistered,
    required this.title,
    this.isSubscription = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state.status == '') {
            return PaymentFailure(isRegistered: isRegistered, isSubscription: isSubscription);
          } else if (state.status == '') {
            return PaymentSuccess(isRegistered: isRegistered, isSubscription: isSubscription);
          } else {
            return PaymentWaiting(
              title: title,
              isRegistered: isRegistered,
              isSubscription: isSubscription,
            );
          }
        },
      ),
    );
  }
}
