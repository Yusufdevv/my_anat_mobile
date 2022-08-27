import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/magazine/presentation/widgets/search_model_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MagazineSearchScreen extends StatefulWidget {
  final JournalBloc bloc;
  const MagazineSearchScreen({required this.bloc, Key? key}) : super(key: key);

  @override
  State<MagazineSearchScreen> createState() => _MagazineSearchScreenState();
}

class _MagazineSearchScreenState extends State<MagazineSearchScreen> {
  late TextEditingController searchController;
  late ScrollController scrollController;
  bool fetchMore = false;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.position.maxScrollExtent - 20 <= scrollController.offset && fetchMore) {
          widget.bloc.add(MoreSearchJournals());
        }
      });
  }

  @override
  void dispose() {
    searchController
      ..clear()
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return WKeyboardDismisser(
      child: BlocProvider.value(
        value: widget.bloc,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(64),
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 16 + mediaQuery.padding.top, 0, 8),
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: woodSmoke.withOpacity(0.12),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SearchField(
                      controller: searchController,
                      onChanged: (value) {
                        widget.bloc.add(SearchJournals(query: value));
                      },
                      onClear: () {
                        widget.bloc.add(SearchJournals(query: ''));
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  WScaleAnimation(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Закрыть',
                      style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
            ),
          ),
          body: BlocBuilder<JournalBloc, JournalState>(
            builder: (context, state) {
              if (state.searchStatus == PaginatorStatus.PAGINATOR_LOADING) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.searchStatus == PaginatorStatus.PAGINATOR_SUCCESS) {
                fetchMore = state.searchFetchMore;
                if (state.searchJournals.isNotEmpty) {
                  return GridView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16)
                          .copyWith(bottom: 20 + MediaQuery.of(context).padding.bottom),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 370,
                          childAspectRatio: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16),
                      itemCount: state.searchJournals.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return SearchedModelsItem(
                          controller: searchController,
                          magazineItemEntity: state.searchJournals[index],
                        );
                      });
                } else {
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 160, width: 160, child: Image.asset(AppImages.illustrations)),
                        Text(
                          'Пока нет результатов',
                          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
                        ),
                        Text(
                          'По вашему запросу мы не могли найти ничего',
                          style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  );
                }
              } else if (state.searchStatus == PaginatorStatus.PAGINATOR_ERROR) {
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
    );
  }
}
