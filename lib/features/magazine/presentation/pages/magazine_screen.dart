import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/data/repositories/journal_repository_impl.dart';
import 'package:anatomica/features/magazine/domain/usecases/get_journal_article_single_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/get_journal_articles_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/get_journal_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/get_journale_single_articles_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/search_journal_usecase.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/magazine/presentation/pages/all_articles.dart';
import 'package:anatomica/features/magazine/presentation/pages/all_journals_screen.dart';
import 'package:anatomica/features/magazine/presentation/pages/magazine_single_item.dart';
import 'package:anatomica/features/magazine/presentation/pages/onetime_payment.dart';
import 'package:anatomica/features/magazine/presentation/widgets/article_item.dart';
import 'package:anatomica/features/magazine/presentation/widgets/magazine_appbar.dart';
import 'package:anatomica/features/magazine/presentation/widgets/magazine_item.dart';
import 'package:anatomica/features/magazine/presentation/widgets/magazine_small_item.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';

class MagazineScreen extends StatefulWidget {
  const MagazineScreen({Key? key}) : super(key: key);

  @override
  State<MagazineScreen> createState() => _MagazineScreenState();
}

class _MagazineScreenState extends State<MagazineScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => JournalBloc(
          getJournalUseCase: GetJournalUseCase(
            repository: serviceLocator<JournalRepositoryImpl>(),
          ),
          searchJournalUseCase: SearchJournalUseCase(
            repository: serviceLocator<JournalRepositoryImpl>(),
          ),
          getJournalArticlesUseCase: GetJournalArticlesUseCase(
            repository: serviceLocator<JournalRepositoryImpl>(),
          ),
          getJournalArticleSingleUseCase: GetJournalArticleSingleUseCase(
            repository: serviceLocator<JournalRepositoryImpl>(),
          ),
          getJournalSingleArticlesUseCase: GetJournalSingleArticlesUseCase(
            repository: serviceLocator<JournalRepositoryImpl>(),
          ))
        ..add(GetJournals())
        ..add(GetJournalArticles()),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: MagazineAppBar(),
        ),
        body: BlocBuilder<JournalBloc, JournalState>(
          builder: (context, state) {
            if (state.status == PaginatorStatus.PAGINATOR_SUCCESS) {
              return CustomScrollView(
                slivers: [
                  if (state.journals.isNotEmpty) ...{
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  LocaleKeys.issues.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(fontSize: 24),
                                ),
                                const Spacer(),
                                WScaleAnimation(
                                  onTap: () {
                                    Navigator.of(context).push(fade(
                                        page: AllJournalsScreen(
                                      bloc: context.read<JournalBloc>(),
                                    )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      children: [
                                        Text(
                                          LocaleKeys.all.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(fontSize: 15),
                                        ),
                                        SvgPicture.asset(AppIcons.arrowRight)
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            MagazineItem(
                              onLeftButtonTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(fade(
                                        page: OneTimePayment(
                                  price: state.journals.first.price,
                                  title: state.journals.first.redaction,
                                  imageUrl: state.journals.first.image.middle,
                                  isJournal: false,
                                  isRegistered: context
                                          .read<AuthenticationBloc>()
                                          .state
                                          .status ==
                                      AuthenticationStatus.authenticated,
                                  subtitle: state.journals.first.redaction,
                                  id: state.journals.first.id,
                                )));
                              },
                              onRightButtonTap: () {},
                              margin: const EdgeInsets.only(right: 16, top: 4),
                              journalEntity: state.journals.first,
                            ),
                          ],
                        ),
                      ),
                    ),
                  },
                  SliverPadding(
                    padding:
                        const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 370,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return MagazineSmallItem(
                            onButtonTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(fade(
                                      page: OneTimePayment(
                                price: state.journals
                                    .skip(1)
                                    .take(4)
                                    .toList()[index]
                                    .price,
                                title: state.journals
                                    .skip(1)
                                    .take(4)
                                    .toList()[index]
                                    .name,
                                imageUrl: state.journals
                                    .skip(1)
                                    .take(4)
                                    .toList()[index]
                                    .image
                                    .middle,
                                isJournal: false,
                                isRegistered: context
                                        .read<AuthenticationBloc>()
                                        .state
                                        .status ==
                                    AuthenticationStatus.authenticated,
                                subtitle: state.journals
                                    .skip(1)
                                    .take(4)
                                    .toList()[index]
                                    .redaction,
                                id: state.journals
                                    .skip(1)
                                    .take(4)
                                    .toList()[index]
                                    .id,
                              )));
                            },
                            onTap: () {
                              Navigator.push(
                                context,
                                fade(
                                  page: MagazineSingleItem(
                                    bloc: context.read<JournalBloc>(),
                                    journal: state.journals
                                        .skip(1)
                                        .take(4)
                                        .toList()[index],
                                  ),
                                ),
                              );
                            },
                            margin: const EdgeInsets.only(top: 20),
                            journalEntity:
                                state.journals.skip(1).take(4).toList()[index],
                          );
                        },
                        childCount: state.journals.skip(1).take(4).length,
                      ),
                    ),
                  ),
                  if (!context
                      .watch<AuthenticationBloc>()
                      .state
                      .user
                      .isSubscribed) ...{
                    SliverToBoxAdapter(
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImages.magazineBack),
                              fit: BoxFit.cover),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              border: Border.all(color: white1),
                              borderRadius: BorderRadius.circular(16),
                              color: white.withOpacity(0.6)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.active_follow.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(fontSize: 20),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                LocaleKeys.get_access.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  WButton(
                                    borderRadius: 6,
                                    height: 34,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    onTap: () {},
                                    child: Text(
                                      LocaleKeys.more.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  },
                  if (state.journalArticleStatus ==
                          PaginatorStatus.PAGINATOR_SUCCESS &&
                      state.journalArticles.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                LocaleKeys.articles.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(fontSize: 24),
                              ),
                            ),
                            const Spacer(),
                            WScaleAnimation(
                              onTap: () => Navigator.of(context).push(fade(
                                  page: AllArticlesScreen(
                                bloc: context.read<JournalBloc>(),
                              ))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 20, 16, 9),
                                child: Row(
                                  children: [
                                    Text(
                                      LocaleKeys.all.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(fontSize: 15),
                                    ),
                                    const SizedBox(width: 1),
                                    SvgPicture.asset(AppIcons.arrowRight)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    if (state.getFirstArticleStatus.isSubmissionSuccess) ...{
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16).copyWith(top: 0),
                          child: Column(
                            children: [
                              WScaleAnimation(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 12, bottom: 16),
                                      height: 188,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: divider),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          width: double.infinity,
                                          imageUrl:
                                              state.firstArticle.image.middle,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        state.firstArticle.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(fontSize: 18),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      state.firstArticle.shortDescription,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    },
                    SliverPadding(
                      padding: EdgeInsets.only(
                        top: 6,
                        left: 16,
                        right: 16,
                        bottom: MediaQuery.of(context).padding.bottom,
                      ),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return ArticleItem(
                              margin: const EdgeInsets.only(bottom: 12),
                              magazineItemEntity: state.journalArticles
                                  .skip(1)
                                  .take(4)
                                  .toList()[index],
                            );
                          },
                          childCount: state.journalArticles
                              .skip(1)
                              .take(4)
                              .length, // 1000 list items
                        ),
                      ),
                    ),
                  ],
                ],
              );
            } else if (state.status == PaginatorStatus.PAGINATOR_LOADING) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state.status == PaginatorStatus.PAGINATOR_ERROR) {
              return const Center(
                child: Text('error'),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
