import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/magazine/data/repositories/journal_repository_impl.dart';
import 'package:anatomica/features/magazine/domain/usecases/get_journal_articles_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/search_journal_usecase.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_search_bloc/journal_search_bloc.dart';
import 'package:anatomica/features/magazine/presentation/widgets/journal_search_appbar.dart';
import 'package:anatomica/features/magazine/presentation/widgets/searched_articles.dart';
import 'package:anatomica/features/magazine/presentation/widgets/searched_journals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MagazineSearchScreen extends StatefulWidget {
  final JournalBloc bloc;

  const MagazineSearchScreen({required this.bloc, Key? key}) : super(key: key);

  @override
  State<MagazineSearchScreen> createState() => _MagazineSearchScreenState();
}

class _MagazineSearchScreenState extends State<MagazineSearchScreen> with TickerProviderStateMixin {
  late TextEditingController _searchController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _searchController = TextEditingController();
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
            ),
          ),
          BlocProvider.value(value: widget.bloc),
        ],
        child: Scaffold(
          appBar: JournalSearchAppBar(
              mediaQuery: mediaQuery, searchController: _searchController, tabController: _tabController),
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
