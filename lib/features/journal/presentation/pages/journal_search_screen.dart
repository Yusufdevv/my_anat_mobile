import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/journal/data/repositories/journal_repository_impl.dart';
import 'package:anatomica/features/journal/domain/usecases/get_journal_articles_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/search_journal_usecase.dart';
import 'package:anatomica/features/journal/presentation/bloc/download/download_bloc.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_search_bloc/journal_search_bloc.dart';
import 'package:anatomica/features/journal/presentation/widgets/journal_search_appbar.dart';
import 'package:anatomica/features/journal/presentation/widgets/searched_articles.dart';
import 'package:anatomica/features/journal/presentation/widgets/searched_journals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MagazineSearchScreen extends StatefulWidget {
  final JournalBloc bloc;
  final DownloadBloc downloadBloc;

  const MagazineSearchScreen(
      {required this.bloc, required this.downloadBloc, Key? key})
      : super(key: key);

  @override
  State<MagazineSearchScreen> createState() => _MagazineSearchScreenState();
}

class _MagazineSearchScreenState extends State<MagazineSearchScreen>
    with TickerProviderStateMixin {
  late TextEditingController _searchController;
  late TabController _tabController;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _searchController = TextEditingController();
    focusNode = FocusNode()..requestFocus();
  }

  @override
  void dispose() {
    _searchController
      ..clear()
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return WKeyboardDismisser(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => JournalSearchBloc(
              searchJournalUseCase: SearchJournalUseCase(
                repository: serviceLocator<JournalRepositoryImpl>(),
              ),
              getJournalArticlesUseCase: GetJournalArticlesUseCase(
                repository: serviceLocator<JournalRepositoryImpl>(),
              ),
            )
              ..add(SearchArticles(query: ''))
              ..add(SearchJournals(query: '')),
          ),
          BlocProvider.value(value: widget.bloc),
          BlocProvider.value(value: widget.downloadBloc),
        ],
        child: Scaffold(
          appBar: JournalSearchAppBar(
              focusNode: focusNode,
              mediaQuery: mediaQuery,
              searchController: _searchController,
              tabController: _tabController),
          body: TabBarView(
            controller: _tabController,
            children: [
              SearchedJournals(searchController: _searchController),
              SearchedArticles(searchController: _searchController),
            ],
          ),
        ),
      ),
    );
  }
}
