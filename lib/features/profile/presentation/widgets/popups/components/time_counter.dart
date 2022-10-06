import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeCounter extends StatefulWidget {
  final VoidCallback onComplete;

  const TimeCounter({Key? key, required this.onComplete}) : super(key: key);

  @override
  State<TimeCounter> createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  late Timer secondsTimer;

  int secondS = 120;
  final _streamController = StreamController<int>.broadcast(sync: true);

  @override
  void initState() {
    secondsTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondS == 0) {
        _streamController.close();
        secondsTimer.cancel();
      } else {
        secondS--;
        _streamController.add(secondS);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    if (secondsTimer.isActive) {
      secondsTimer.cancel();
    }
    super.dispose();
  }

  String printTime(int timeLeft) {
    final minutesLeft = timeLeft ~/ 60;
    final secondsLeft = timeLeft % 60;
    return '$minutesLeft:${secondsLeft < 10 ? '0$secondsLeft' : secondsLeft}';
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<int>(
        stream: _streamController.stream
          ..listen((event) {}, onDone: widget.onComplete),
        initialData: 120,
        builder: (context, duration) => Text(
          printTime(duration.data as int),
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontWeight: FontWeight.w600),
        ),
      );
}
