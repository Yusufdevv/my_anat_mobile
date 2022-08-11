import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/default_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/phone_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  bool isPhone = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, MediaQuery.of(context).padding.bottom + 16),
      child: Column(
        children: [
          if (isPhone) ...{
            PhoneTextField(
              hasError: true,
              errorText: 'dfsdkfjskdfjskdfjskdfjskdfjskfjksdjfksjfksdjfksdfjkj',
              title: 'Номер телефона',
              controller: TextEditingController(),
            ),
          } else ...{
            DefaultTextField(
              title: 'Электронная почта',
              controller: TextEditingController(),
              onChanged: (value) {},
              prefix: Padding(
                padding: const EdgeInsets.only(left: 12, right: 8),
                child: SvgPicture.asset(AppIcons.mail),
              ),
              hintText: 'Введите адрес электронной почты',
            ),
          },
          Text.rich(
            TextSpan(
              text: 'Восстановить через',
              style: Theme.of(context).textTheme.headline3,
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        isPhone = !isPhone;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 16, 4, 16),
                      child: Text(
                        isPhone ? 'электронную почту' : 'номер телефона',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          WButton(
            text: 'Далее',
            onTap: () {
              widget.pageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
            },
          )
        ],
      ),
    );
  }
}
