import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_tab_bar.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/candidate_single.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/vacancy_single.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(126),
        child: Column(
          children: [
            const WAppBar(title: 'Избранные', hasUnderline: true),
            WTabBar(
              tabController: tabController,
              tabs: const [
                Tab(text: 'Вакансии'),
                Tab(text: 'Кандидаты'),
              ],
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ListView.separated(
            padding: const EdgeInsets.only(top: 20),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => VacancyItem(
              onTap: () {
                Navigator.of(context).push(fade(page: const VacancySingleScreen()));
              },
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: 10,
          ),
          ListView.separated(
            padding: const EdgeInsets.only(top: 20),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => CandidateItem(
              onTap: () {
                Navigator.of(context).push(fade(page: const CandidateSingleScreen()));
              },
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: 10,
          )
        ],
      ),
    );
  }
}
