import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/common/presentation/widgets/w_tab_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_textfield.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/search_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_title_text.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class VacancySearchScreen extends StatefulWidget {
  const VacancySearchScreen({Key? key}) : super(key: key);

  @override
  State<VacancySearchScreen> createState() => _VacancySearchScreenState();
}

class _VacancySearchScreenState extends State<VacancySearchScreen> with TickerProviderStateMixin {
  late TabController tabController;
  late TextEditingController controller;

  @override
  initState() {
    tabController = TabController(length: 2, vsync: this);
    controller = TextEditingController();
    super.initState();
  }

  @override
  dispose() {
    tabController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return KeyboardDismisser(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(132),
          child: Container(
            padding: EdgeInsets.fromLTRB(16, 8 + mediaQuery.padding.top, 16, 16),
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 24,
                  color: woodSmoke.withOpacity(0.12),
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    WScaleAnimation(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Отмена',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: WTextField(
                        controller: controller,
                        height: 40,
                        onChanged: (v) {},
                        onTapSuffix: () {
                          setState(
                            () {
                              controller.clear();
                            },
                          );
                        },
                        suffixIcon: AppIcons.x,
                      ),
                    )
                  ],
                ),
                WTabBar(
                  tabController: tabController,
                  tabs: const [
                    Tab(text: 'Вакансии'),
                    Tab(text: 'Кандидаты'),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 29, 0, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VacancyTitleText(title: 'Популярные запросы'),
                  const WDivider(margin: EdgeInsets.symmetric(vertical: 13)),
                  Container(
                    color: white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                            3, (index) => SearchItem(isLast: index == 2 ? true : false)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(),
          ],
        ),
      ),
    );
  }
}
