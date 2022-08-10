import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/company_card.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_appbar.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_card.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VacancyScreen extends StatefulWidget {
  const VacancyScreen({Key? key}) : super(key: key);

  @override
  State<VacancyScreen> createState() => _VacancyScreenState();
}

class _VacancyScreenState extends State<VacancyScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: VacancyAppBar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 12),
              child: Text(
                'Категории',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DefaultTabController(
                length: 3,
                child: Row(
                  children: [
                    ButtonsTabBar(
                      backgroundColor: white,
                      unselectedBackgroundColor: white,
                      unselectedBorderColor: pattensBlue,
                      borderWidth: 1,
                      labelStyle: const TextStyle(color: darkGreen),
                      unselectedLabelStyle: const TextStyle(color: darkGreen),
                      height: 37,
                      radius: 12,
                      borderColor: pattensBlue,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      tabs: const [
                        Tab(text: 'Стоматолог'),
                        Tab(text: 'Кардиолог'),
                        Tab(text: 'Терапевт'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 12),
              child: Text(
                'Топ вакансии от компании',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: pattensBlue)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CompanyCard(),
                  SizedBox(height: 10),
                  WDivider(),
                  SizedBox(height: 10),
                  VacancyCard(),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
