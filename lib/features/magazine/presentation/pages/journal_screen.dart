import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/magazine/data/repositories/journal_repository_impl.dart';
import 'package:anatomica/features/magazine/domain/usecases/get_journal_article_single_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/get_journal_articles_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/get_journal_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/get_journale_single_articles_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/search_journal_usecase.dart';
import 'package:anatomica/features/magazine/presentation/bloc/download/download_bloc.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/magazine/presentation/pages/all_articles.dart';
import 'package:anatomica/features/magazine/presentation/widgets/activate_premium.dart';
import 'package:anatomica/features/magazine/presentation/widgets/article_item.dart';
import 'package:anatomica/features/magazine/presentation/widgets/first_article.dart';
import 'package:anatomica/features/magazine/presentation/widgets/first_journal.dart';
import 'package:anatomica/features/magazine/presentation/widgets/journals_list.dart';
import 'package:anatomica/features/magazine/presentation/widgets/magazine_appbar.dart';
import 'package:anatomica/features/magazine/presentation/widgets/title_with_suffix_action.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class MagazineScreen extends StatelessWidget {
  const MagazineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DownloadBloc(),
      child: BlocProvider(
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
          ),
        )
          ..add(GetJournals())
          ..add(GetJournalArticles()),
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
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
                        FirstJournal(state: state),
                      },
                      JournalsList(state: state),
                      if (!context.watch<AuthenticationBloc>().state.user.isSubscribed) ...{
                        ActivatePremium(images: state.journals.map((e) => e.image).toList()),
                      },
                      if (state.journalArticleStatus == PaginatorStatus.PAGINATOR_SUCCESS &&
                          state.journalArticles.isNotEmpty) ...[
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: TitleWithSuffixAction(
                              title: LocaleKeys.articles.tr(),
                              onTap: () {
                                Navigator.of(context).push(
                                  fade(
                                    page: AllArticlesScreen(
                                      bloc: context.read<JournalBloc>(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        if (state.getFirstArticleStatus.isSubmissionSuccess) ...{
                          FirstArticle(state: state),
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
                                  magazineItemEntity: state.journalArticles.skip(1).take(4).toList()[index],
                                );
                              },
                              childCount: state.journalArticles.skip(1).take(4).length, // 1000 list items
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
        ),
      ),
    );
  }
}
