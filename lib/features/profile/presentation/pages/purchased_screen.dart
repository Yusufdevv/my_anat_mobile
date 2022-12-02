import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/profile/domain/usecases/get_purchased_article.dart';
import 'package:anatomica/features/profile/domain/usecases/get_purchased_journal.dart';
import 'package:anatomica/features/profile/domain/usecases/restore.dart';
import 'package:anatomica/features/profile/domain/usecases/send_verify_code.dart';
import 'package:anatomica/features/profile/domain/usecases/verify_restore.dart';
import 'package:anatomica/features/profile/presentation/blocs/purchased_article/purchased_article_bloc.dart';
import 'package:anatomica/features/profile/presentation/blocs/purchased_journal/purchased_journal_bloc.dart';
import 'package:anatomica/features/profile/presentation/blocs/restore/restore_bloc.dart';
import 'package:anatomica/features/profile/presentation/parts/purchased_article_list.dart';
import 'package:anatomica/features/profile/presentation/parts/purchased_journal_list.dart';
import 'package:anatomica/features/profile/presentation/widgets/popups/restore_phone.dart';
import 'package:anatomica/features/profile/presentation/widgets/popups/restore_verify.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PurchasedScreen extends StatefulWidget {
  final bool isRegistered;
  const PurchasedScreen({this.isRegistered = true, Key? key}) : super(key: key);

  @override
  State<PurchasedScreen> createState() => _PurchasedScreenState();
}

class _PurchasedScreenState extends State<PurchasedScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late PurchasedJournalBloc purchasedJournalBloc;
  late PurchasedArticleBloc purchasedArticleBloc;
  late RestoreBloc restoreBloc;

  @override
  void initState() {
    restoreBloc =
        RestoreBloc(sendRestore: SendRestoreCode(), verifyRestore: VerifyRestoreCode(), restore: RestoreUseCase());
    purchasedJournalBloc = PurchasedJournalBloc(GetPurchasedJournalUS())
      ..add(PurchasedJournalEvent.getArticle(isRefresh: false));
    purchasedArticleBloc = PurchasedArticleBloc(GetPurchasedArticleUS())
      ..add(PurchasedArticleEvent.getArticle(isRefresh: false));
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: restoreBloc,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
            child: BlocBuilder<RestoreBloc, RestoreState>(
              builder: (context, state) {
                return Column(
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
                            boxShadow: const [
                              BoxShadow(blurRadius: 24, offset: Offset(0, 8), color: Color(0x302B8364))
                            ]),
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
                    if (state.showRestore ?? !(StorageRepository.getBool('is_purchase_restored', defValue: false))) ...[
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: primary),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.edit,
                              width: 24,
                              height: 24,
                              color: white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                LocaleKeys.restore_things.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(fontWeight: FontWeight.w600, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            WButton(
                              borderRadius: 8,
                              text: LocaleKeys.restore.tr(),
                              textColor: primary,
                              color: white,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              onTap: () async {
                                var item = await showDialog<bool>(
                                    context: context,
                                    builder: (c) {
                                      return MultiBlocProvider(
                                        providers: [
                                          BlocProvider.value(value: restoreBloc),
                                          BlocProvider.value(value: purchasedJournalBloc),
                                          BlocProvider.value(value: purchasedArticleBloc),
                                        ],
                                        child: RestorePhoneDialog(
                                          isJournal: _tabController.index == 1,
                                          onSucces: () async {
                                            var item = await showDialog<bool>(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (b) {
                                                  return MultiBlocProvider(
                                                    providers: [
                                                      BlocProvider.value(value: restoreBloc),
                                                      BlocProvider.value(value: purchasedJournalBloc),
                                                      BlocProvider.value(value: purchasedArticleBloc),
                                                    ],
                                                    child: RestoreVerifyDialog(
                                                      isJournal: _tabController.index == 1,
                                                    ),
                                                  );
                                                });
                                            if (item == null) {
                                              restoreBloc.add(RestoreEvent.clear());
                                            }
                                          },
                                        ),
                                      );
                                    });

                                if (item == null) {
                                  restoreBloc.add(RestoreEvent.clear());
                                }
                                setState(() {});
                              },
                              height: 36,
                            )
                          ],
                        ),
                      ),
                    ],
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
                );
              },
            ),
          ),
        ),
      );
}
