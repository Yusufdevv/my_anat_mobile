import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/phone_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/profile/presentation/blocs/purchased_article/purchased_article_bloc.dart';
import 'package:anatomica/features/profile/presentation/blocs/purchased_journal/purchased_journal_bloc.dart';
import 'package:anatomica/features/profile/presentation/blocs/restore/restore_bloc.dart';
import 'package:anatomica/features/profile/presentation/widgets/popups/restore_verify.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RestorePhoneDialog extends StatefulWidget {
  final bool isJournal;
  final VoidCallback onSucces;

  const RestorePhoneDialog({required this.isJournal,required this.onSucces, Key? key})
      : super(key: key);

  @override
  State<RestorePhoneDialog> createState() => _RestorePhoneDialogState();
}

class _RestorePhoneDialogState extends State<RestorePhoneDialog> {
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
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      LocaleKeys.restore_purchased_articles.tr(),
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
                LocaleKeys.write_phone_restore.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              const SizedBox(
                height: 12,
              ),
              PhoneTextField(
                title: LocaleKeys.phone_number.tr(),
                controller: controller,
              ),
              const SizedBox(
                height: 24,
              ),
              WButton(
                padding: EdgeInsets.zero,
                onTap: () {
                  if (controller.text.length == 12) {
                    context.read<RestoreBloc>().add(RestoreEvent.sendCode(
                        phone: '+998${controller.text.replaceAll(' ', '')}',
                        onSuccess: () async{
                          Navigator.pop(context,true);
                          widget.onSucces();
                        }));
                  }
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
