import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/profile/data/models/purchased_article.dart';
import 'package:anatomica/features/profile/data/models/purchased_journal.dart';
import 'package:anatomica/features/profile/domain/usecases/get_purchased_article.dart';
import 'package:anatomica/features/profile/domain/usecases/get_purchased_journal.dart';
import 'package:anatomica/features/profile/presentation/blocs/purchased_article/purchased_article_bloc.dart';
import 'package:anatomica/features/profile/presentation/blocs/purchased_journal/purchased_journal_bloc.dart';
import 'package:anatomica/features/profile/presentation/parts/purchased_article_list.dart';
import 'package:anatomica/features/profile/presentation/parts/purchased_journal_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchasedScreen extends StatefulWidget {
  const PurchasedScreen({Key? key}) : super(key: key);

  @override
  State<PurchasedScreen> createState() => _PurchasedScreenState();
}

class _PurchasedScreenState extends State<PurchasedScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late PurchasedJournalBloc purchasedJournalBloc;
  late PurchasedArticleBloc purchasedArticleBloc;

  @override
  void initState() {
    purchasedJournalBloc = PurchasedJournalBloc(GetPurchasedJournalUS())
      ..add(PurchasedJournalEvent.getArticle(isRefresh: false));
    purchasedArticleBloc = PurchasedArticleBloc(GetPurchasedArticleUS())
      ..add(PurchasedArticleEvent.getArticle(isRefresh: false));
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          title: 'Покупка',
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: purchasedArticleBloc),
            BlocProvider.value(value: purchasedJournalBloc),
          ],
          child: Column(
            children: [
              const Divider(
                color: lilyWhite,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 44,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff75FFFFFF)),
                    color: const Color(0xffF0F5F3),
                    borderRadius: BorderRadius.circular(10)),
                child: TabBar(
                  padding: const EdgeInsets.all(6),
                  indicatorColor: white,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: white,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 24,
                            offset: Offset(0, 8),
                            color: Color(0x302B8364))
                      ]),
                  labelColor: black,
                  unselectedLabelColor: textSecondary,
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      text: 'Купленные статьи',
                    ),
                    Tab(
                      text: 'Купленные выпуски',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                  child: TabBarView(controller: _tabController,
                children: [PurchasedArticleList(), PurchasedJournalList()],
              ))
            ],
          ),
        ),
      );
}
