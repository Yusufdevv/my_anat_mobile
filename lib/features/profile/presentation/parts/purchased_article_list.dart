import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/empty_page.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/profile/presentation/blocs/purchased_article/purchased_article_bloc.dart';
import 'package:anatomica/features/profile/presentation/blocs/purchased_article/purchased_article_bloc.dart';
import 'package:anatomica/features/profile/presentation/widgets/purchased_article_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class PurchasedArticleList extends StatelessWidget {
  const PurchasedArticleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<PurchasedArticleBloc, PurchasedArticleState>(
        builder: (context, state) {
          return Paginator(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              emptyWidget: const EmptyPage(
                  title: 'Ничего не найдено', iconPath: AppIcons.emptyA,desc: 'Вы ещё не покупали статью',),
              paginatorStatus:
                  state.paginationStatus == FormzStatus.submissionInProgress
                      ? PaginatorStatus.PAGINATOR_LOADING
                      : PaginatorStatus.PAGINATOR_SUCCESS,
              itemBuilder: (context, index) => PurchasedArticleCard(
                    entity: state.articles[index],
                  ),
              itemCount: state.articles.length,
              fetchMoreFunction: () {
                context
                    .read<PurchasedArticleBloc>()
                    .add(PurchasedArticleEvent.getMoreArticle());
              },
              hasMoreToFetch: state.count > state.articles.length,
              errorWidget: const SizedBox());
        },
      );
}
