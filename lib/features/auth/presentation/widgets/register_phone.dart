import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/default_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/phone_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPhone extends StatefulWidget {
  final TabController tabController;
  final VoidCallback onTap;

  const RegisterPhone({required this.onTap, required this.tabController, Key? key}) : super(key: key);

  @override
  State<RegisterPhone> createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Container(
            decoration: BoxDecoration(
              color: lilyWhite,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 36,
            child: TabBar(
              padding: const EdgeInsets.all(2),
              indicator: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                    color: chipShadowColor.withOpacity(0.19),
                  ),
                ],
                borderRadius: BorderRadius.circular(6),
                color: white,
              ),
              controller: widget.tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              onTap: (s) {},
              unselectedLabelStyle: Theme.of(context).textTheme.headline3,
              labelStyle: Theme.of(context).textTheme.headline3,
              unselectedLabelColor: textSecondary,
              labelColor: textColor,
              tabs: const [
                Text('Номер телефона'),
                Text('Электронная почта'),
              ],
            ),
          ),
        ),
        const Divider(
          height: 0,
          thickness: 1,
          color: textFieldColor,
        ),
        Expanded(
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: widget.tabController,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: PhoneTextField(
                  title: 'Номер телефона',
                  controller: TextEditingController(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: DefaultTextField(
                  title: 'Электронная почта',
                  controller: TextEditingController(),
                  onChanged: (value) {},
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    child: SvgPicture.asset(AppIcons.mail),
                  ),
                  hintText: 'example@anatomica.uz',
                ),
              ),
            ],
          ),
        ),
        WButton(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 16 + MediaQuery.of(context).padding.bottom),
          onTap: widget.onTap,
          text: 'Подтвердить',
        )
      ],
    );
  }
}
