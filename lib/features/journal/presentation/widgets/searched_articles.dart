import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_search_bloc/journal_search_bloc.dart';
import 'package:anatomica/features/journal/presentation/widgets/article_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchedArticles extends StatelessWidget {
  const SearchedArticles({
    Key? key,
    required TextEditingController searchController,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JournalSearchBloc, JournalSearchState>(
      builder: (context, state) {
        return Paginator(
          paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(
              state.searchArticleStatus),
          itemBuilder: (context, index) => ArticleItem(
            magazineItemEntity: state.searchArticles[index],
            searchString: _searchController.text,
          ),
          itemCount: state.searchArticles.length,
          fetchMoreFunction: () {
            context.read<JournalSearchBloc>().add(MoreSearchArticles());
          },
          emptyWidget: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 160,
                    width: 160,
                    child: Image.asset(AppImages.illustrations)),
                Text(
                  LocaleKeys.no_results.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 20),
                ),
                Text(
                  LocaleKeys.could_not_find.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          hasMoreToFetch: state.searchArticleFetchMore,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20)
              .copyWith(bottom: MediaQuery.of(context).padding.bottom + 20),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          errorWidget: const Text('error'),
        );
      },
    );
  }
}
