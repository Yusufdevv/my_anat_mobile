import 'package:anatomica/features/profile/presentation/widgets/popups/components/refresh_button.dart';
import 'package:anatomica/features/profile/presentation/widgets/popups/components/time_counter.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshPanel extends StatefulWidget {
  const RefreshPanel({Key? key}) : super(key: key);

  @override
  State<RefreshPanel> createState() => _RefreshPanelState();
}

class _RefreshPanelState extends State<RefreshPanel> {
  bool timeComplete = false;

  @override
  Widget build(BuildContext context) => Container(
        child: Row(
          children: [
            Text(
              LocaleKeys.resend_code.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
            ),
            const SizedBox(
              width: 6,
            ),
            if (timeComplete)
              RefreshButton(
                onSucces: () {
                  setState(() {
                    timeComplete = false;
                  });
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
        ),
      );
}
