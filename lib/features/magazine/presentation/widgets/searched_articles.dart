import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_search_bloc/journal_search_bloc.dart';
import 'package:anatomica/features/magazine/presentation/widgets/search_model_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
        if (state.searchStatus == PaginatorStatus.PAGINATOR_LOADING) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state.searchStatus == PaginatorStatus.PAGINATOR_SUCCESS) {
          if (state.searchJournals.isNotEmpty) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16)
                  .copyWith(bottom: 20 + MediaQuery.of(context).padding.bottom),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 370,
                  childAspectRatio: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16),
              itemCount: (state.searchJournals.length + 1) % 2 == 0
                  ? state.searchJournals.length + 1
                  : state.searchJournals.length,
              itemBuilder: (context, index) {
                if (index == state.searchJournals.length) {
                  if (state.searchFetchMore) {
                    context.read<JournalSearchBloc>().add(MoreSearchJournals());
                  }
                  return const SizedBox.shrink();
                } else {
                  return SearchedModelsItem(
                    controller: _searchController,
                    magazineItemEntity: state.searchJournals[index],
                  );
                }
              },
            );
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
                    LocaleKeys.no_results.tr(),
                    style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
                  ),
                  Text(
                    LocaleKeys.could_not_find.tr(),
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
    );
  }
}
