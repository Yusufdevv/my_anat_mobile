import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_search_bloc/journal_search_bloc.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JournalSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const JournalSearchAppBar({
    Key? key,
    required this.mediaQuery,
    required TextEditingController searchController,
    required TabController tabController,
    FocusNode? focusNode,
  })  : _searchController = searchController,
        _tabController = tabController,
        _focusNode = focusNode,
        super(key: key);

  final MediaQueryData mediaQuery;
  final TextEditingController _searchController;
  final TabController _tabController;
  final FocusNode? _focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16 + mediaQuery.padding.top, 0, 16),
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SearchField(
                  focusNode: _focusNode,
                  controller: _searchController,
                  onChanged: (value) {
                    if (value.length >= 3 || value.isEmpty) {
                      context
                          .read<JournalSearchBloc>()
                          .add(SearchJournals(query: value));
                      context
                          .read<JournalSearchBloc>()
                          .add(SearchArticles(query: value));
                    }
                  },
                  onClear: () {
                    context
                        .read<JournalSearchBloc>()
                        .add(SearchJournals(query: ''));
                    context
                        .read<JournalSearchBloc>()
                        .add(SearchArticles(query: ''));
                  },
                ),
              ),
              const SizedBox(width: 8),
              WScaleAnimation(
                onTap: () {
                  context
                      .read<JournalSearchBloc>()
                      .add(SearchJournals(query: ''));
                  context
                      .read<JournalSearchBloc>()
                      .add(SearchArticles(query: ''));
                  Navigator.pop(context);
                },
                child: Text(
                  LocaleKeys.close.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 12),
                ),
              ),
              const SizedBox(
                width: 16,
              )
            ],
          ),
          Container(
            height: 36,
            decoration: BoxDecoration(
              color: textFieldColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.only(right: 16, top: 16),
            child: TabBar(
              controller: _tabController,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              indicator: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 8),
                      blurRadius: 24,
                      color: chipShadowColor.withOpacity(0.19),
                    ),
                  ]),
              labelPadding: EdgeInsets.zero,
              labelStyle: Theme.of(context).textTheme.displaySmall,
              labelColor: textColor,
              onTap: (index) {},
              unselectedLabelColor: textSecondary,
              tabs: [
                Tab(text: LocaleKeys.issues.tr()),
                Tab(text: LocaleKeys.articles.tr()),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(124);
}
