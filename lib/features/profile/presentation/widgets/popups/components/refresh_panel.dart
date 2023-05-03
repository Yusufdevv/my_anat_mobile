import 'package:anatomica/features/profile/presentation/widgets/popups/components/refresh_button.dart';
import 'package:anatomica/features/profile/presentation/widgets/popups/components/time_counter.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RefreshPanel extends StatefulWidget {
  final VoidCallback? onSuccess;
  final String? phone;
  const RefreshPanel({this.onSuccess, this.phone, Key? key}) : super(key: key);

  @override
  State<RefreshPanel> createState() => _RefreshPanelState();
}

class _RefreshPanelState extends State<RefreshPanel> {
  bool timeComplete = false;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Text(
            LocaleKeys.resend_code.tr(),
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
          ),
          const SizedBox(
            width: 6,
          ),
          if (timeComplete)
            RefreshButton(
              phone: widget.phone,
              onSucces: () {
                setState(() {
                  timeComplete = false;
                });
                if (widget.onSuccess != null) {
                  widget.onSuccess!();
                }
              },
            )
          else
            SizedBox(
              height: 16,
              child: TimeCounter(
                onComplete: () {
                  setState(() {
                    timeComplete = true;
                  });
                },
              ),
            )
        ],
      );
}
