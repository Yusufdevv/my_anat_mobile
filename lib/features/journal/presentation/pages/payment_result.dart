import 'package:anatomica/features/journal/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:anatomica/features/journal/presentation/pages/payment_failure.dart';
import 'package:anatomica/features/journal/presentation/pages/payment_success.dart';
import 'package:anatomica/features/journal/presentation/pages/payment_waiting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentResultScreen extends StatefulWidget {
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
  State<PaymentResultScreen> createState() => _PaymentResultScreenState();
}

class _PaymentResultScreenState extends State<PaymentResultScreen> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print('resumed');
        widget.bloc.add(CheckPaymentStatus());
        break;
      case AppLifecycleState.inactive:
        print('inactive');

        break;
      case AppLifecycleState.paused:
        print('paused');

        break;
      case AppLifecycleState.detached:
        print('detached');

        break;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state.status == 'waiting') {
            return PaymentWaiting(
              title: widget.title,
              isRegistered: widget.isRegistered,
              isSubscription: widget.isSubscription,
            );
          } else if (state.status == 'confirmed') {
            return PaymentSuccess(
                title: widget.title, isRegistered: widget.isRegistered, isSubscription: widget.isSubscription);
          } else if (state.status.isNotEmpty) {
            return PaymentFailure(
                title: widget.title, isRegistered: widget.isRegistered, isSubscription: widget.isSubscription);
          } else {
            return PaymentWaiting(
              title: widget.title,
              isRegistered: widget.isRegistered,
              isSubscription: widget.isSubscription,
            );
          }
        },
      ),
    );
  }
}
