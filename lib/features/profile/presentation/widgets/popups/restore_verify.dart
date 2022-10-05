import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/phone_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

showRestoreVerify(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const RestoreVerifyDialog();
      });
}

class RestoreVerifyDialog extends StatefulWidget {
  const RestoreVerifyDialog({Key? key}) : super(key: key);

  @override
  State<RestoreVerifyDialog> createState() => _RestoreVerifyDialogState();
}

class _RestoreVerifyDialogState extends State<RestoreVerifyDialog> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          height: 270,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Верификация',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppIcons.close,
                      width: 24,
                      height: 24,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Введите код который был отправлен на номер',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Text(
                  '+998 (99) ******60',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              WButton(
                padding: EdgeInsets.zero,
                onTap: () {
                  Navigator.pop(context);
                },
                height: 40,
                borderRadius: 6,
                text: LocaleKeys.next.tr(),
                textColor: white,
              )
            ],
          ),
        ),
      );
}
