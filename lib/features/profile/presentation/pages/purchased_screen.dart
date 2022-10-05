import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/profile/domain/usecases/get_purchased_article.dart';
import 'package:anatomica/features/profile/domain/usecases/get_purchased_journal.dart';
import 'package:anatomica/features/profile/presentation/blocs/purchased_article/purchased_article_bloc.dart';
import 'package:anatomica/features/profile/presentation/blocs/purchased_journal/purchased_journal_bloc.dart';
import 'package:anatomica/features/profile/presentation/parts/purchased_article_list.dart';
import 'package:anatomica/features/profile/presentation/parts/purchased_journal_list.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PurchasedScreen extends StatefulWidget {
  const PurchasedScreen({Key? key}) : super(key: key);

  @override
  State<PurchasedScreen> createState() => _PurchasedScreenState();
}

class _PurchasedScreenState extends State<PurchasedScreen> with TickerProviderStateMixin {
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
        appBar: AppBar(
          elevation: 1,
          shadowColor: textFieldColor,
          toolbarHeight: 52,
          leading: WScaleAnimation(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: SvgPicture.asset(
                AppIcons.arrowLeft,
                color: textColor,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            LocaleKeys.purchased.tr(),
            style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          titleSpacing: 0,
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: purchasedArticleBloc),
            BlocProvider.value(value: purchasedJournalBloc),
          ],
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 44,
                decoration: BoxDecoration(
                    border: Border.all(color: white.withOpacity(0.46)),
                    color: const Color(0xffF0F5F3),
                    borderRadius: BorderRadius.circular(10)),
                child: TabBar(
                  padding: const EdgeInsets.all(6),
                  indicatorColor: white,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: white,
                      boxShadow: const [BoxShadow(blurRadius: 24, offset: Offset(0, 8), color: Color(0x302B8364))]),
                  labelColor: textColor,
                  unselectedLabelColor: textSecondary,
                  labelStyle: Theme.of(context).textTheme.headline3,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      text: LocaleKeys.purchased_articles.tr(),
                    ),
                    Tab(
                      text: LocaleKeys.purchased_journals.tr(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                  child: TabBarView(
                controller: _tabController,
                children: const [
                  PurchasedArticleList(),
                  PurchasedJournalList(),
                ],
              ))
            ],
          ),
        ),
      );
}
