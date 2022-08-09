import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPhone extends StatefulWidget {
  final TabController tabController;
  final VoidCallback onTap;

  const RegisterPhone({required this.onTap, required this.tabController, Key? key})
      : super(key: key);

  @override
  State<RegisterPhone> createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: lilyWhite,
            borderRadius: BorderRadius.circular(8),
          ),
          height: 36,
          child: TabBar(
            padding: const EdgeInsets.all(2),
            indicator: ShapeDecoration(
              shadows: [
                BoxShadow(
                    blurRadius: 1,
                    offset: const Offset(0, 3),
                    color: const Color(0xff000000).withOpacity(0.04)),
                BoxShadow(
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                    color: const Color(0xff000000).withOpacity(0.12)),
              ],
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: const Color(0xff000000).withOpacity(0.04)),
                  borderRadius: BorderRadius.circular(7)),
              color: Colors.white,
            ),
            controller: widget.tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            onTap: (s) {},
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
            labelStyle: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
            unselectedLabelColor: textSecondary,
            labelColor: black,
            tabs: const [
              Text('Номер телефона'),
              Text('Электронная почта'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: widget.tabController,
            children: [
              Column(
                children: [
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 16),
                  WTextField(
                    title: 'Номер телефона',
                    onChanged: (v) {},
                  ),
                  const Spacer(),
                  WButton(
                    onTap: widget.onTap,
                    text: 'Подтвердить',
                  )
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 16),
                  WTextField(
                    title: 'Электронная почта',
                    onChanged: (v) {},
                  ),
                  const Spacer(),
                  WButton(
                    onTap: () {},
                    text: 'Подтвердить',
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
