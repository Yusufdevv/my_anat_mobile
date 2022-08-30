import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/domain/entity/magazine_item_entity.dart';
import 'package:anatomica/features/magazine/presentation/widgets/onetime_payment_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class OneTimePayment extends StatefulWidget {
  const OneTimePayment({Key? key}) : super(key: key);

  @override
  State<OneTimePayment> createState() => _OneTimePaymentState();
}

class _OneTimePaymentState extends State<OneTimePayment>
    with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          shadowColor: textFieldColor,
          toolbarHeight: 120,
          titleSpacing: 0,
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 13, right: 16, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Text(
                      LocaleKeys.only_pay.tr(),
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const Spacer(),
                    WScaleAnimation(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AppIcons.close,
                        color: black,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Container(
                height: 36,
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: textFieldColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  controller: controller,
                  padding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsets.zero,
                  indicator: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  labelPadding: EdgeInsets.zero,
                  labelStyle: Theme.of(context).textTheme.headline3,
                  labelColor: textColor,
                  onTap: (index) {},
                  unselectedLabelColor: textSecondary,
                  tabs: [
                    Tab(text: LocaleKeys.organization.tr()),
                    Tab(text: LocaleKeys.doctor.tr()),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(controller: controller, children: [
          OneTimePaymentTabs(
            magazineItemEntity: const MagazineItemEntity(
                today: 'Сегодня, 16:48',
                imageUrl:
                    'https://images.unsplash.com/photo-1569245087840-dcf487ddbad5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGdpcmwlMjBpc2xhbXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                date: 'Июнь 2022',
                authorName: 'Феруза Алавия',
                price: 123123,
                title: 'Главный врач клиники Doctor D.'),
            onTap: () {},
          ),
          OneTimePaymentTabs(
            magazineItemEntity: const MagazineItemEntity(
                today: 'Сегодня, 16:48',
                imageUrl:
                    'https://images.unsplash.com/photo-1569245087840-dcf487ddbad5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGdpcmwlMjBpc2xhbXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                date: 'Июнь 2022',
                authorName: 'Феруза Алавия',
                price: 123123,
                title: 'Главный врач клиники Doctor D.'),
            onTap: () {},
          ),
        ]),
      ),
    );
  }
}
