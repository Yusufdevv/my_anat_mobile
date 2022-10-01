import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/h_articles/h_articles_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/article_item.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalArticles extends StatelessWidget {
  const HospitalArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HArticlesBloc, HArticlesState>(
      builder: (context, state) {
        return Paginator(
          hasMoreToFetch: state.fetchMore,
          fetchMoreFunction: () {
            context.read<HArticlesBloc>().add(HArticlesEvent.getMoreArticles());
          },
          paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(state.status),
          errorWidget: const Text('error'),
          itemCount: state.articles.length,
          padding: state.articles.isEmpty
              ? EdgeInsets.zero
              : const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
          emptyWidget: SingleChildScrollView(
            child: EmptyWidget(
              title: LocaleKeys.no_articles.tr(),
              content: LocaleKeys.no_articles.tr(),
            ),
          ),
          itemBuilder: (context, index) => HospitalArticleItem(
            entity: state.articles[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        );
      },
    );
  }
}
