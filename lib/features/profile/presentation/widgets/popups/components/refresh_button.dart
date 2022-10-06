import 'dart:async';

import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/profile/presentation/blocs/restore/restore_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';


class RefreshButton extends StatefulWidget {
  final VoidCallback onSucces;


  const RefreshButton({Key? key, required this.onSucces, }) : super(key: key);

  @override
  State<RefreshButton> createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      upperBound: 1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          context.read<RestoreBloc>().add(RestoreEvent.resendCode(
              onSuccess: () {
                _controller.repeat().whenCompleteOrCancel(() {});
                Timer(const Duration(milliseconds: 1000), () {
                  _controller.stop();
                  widget.onSucces();
                });
              }));
        },
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: SvgPicture.asset(
            AppIcons.refresh,
            width: 16,
            height: 16,
          ),
        ),
      );
}
