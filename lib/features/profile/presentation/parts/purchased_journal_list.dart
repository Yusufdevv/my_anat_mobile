import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/empty_page.dart';
import 'package:anatomica/features/common/presentation/widgets/grid_paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/profile/presentation/blocs/purchased_journal/purchased_journal_bloc.dart';
import 'package:anatomica/features/profile/presentation/widgets/purchased_journal_card.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class PurchasedJournalList extends StatelessWidget {
  const PurchasedJournalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<PurchasedJournalBloc, PurchasedJournalState>(
        builder: (context, state) {
          return GridPaginator(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            emptyWidget: EmptyPage(
              title: LocaleKeys.nothing.tr(),
              iconPath: AppIcons.emptyA,
              desc: LocaleKeys.no_purchased_journals.tr(),
            ),
            paginatorStatus: state.paginationStatus == FormzStatus.submissionInProgress
                ? PaginatorStatus.PAGINATOR_LOADING
                : PaginatorStatus.PAGINATOR_SUCCESS,
            itemBuilder: (context, index) => PurchasedJournalCard(
              entity: state.journals[index],
            ),
            itemCount: state.journals.length,
            fetchMoreFunction: () {
              context.read<PurchasedJournalBloc>().add(PurchasedJournalEvent.getMoreArticle());
            },
            hasMoreToFetch: state.count > state.journals.length,
            errorWidget: const SizedBox(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 278,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
            ),
          );
        },
      );
}
