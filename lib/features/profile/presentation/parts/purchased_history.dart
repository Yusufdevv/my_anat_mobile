import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/profile/presentation/blocs/purchased_journal/purchased_journal_bloc.dart';
import 'package:anatomica/features/profile/presentation/blocs/restore/restore_bloc.dart';
import 'package:anatomica/features/profile/presentation/widgets/purchased_history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

class PurchasedHistoryList extends StatelessWidget {
  const PurchasedHistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PurchasedHistoryItem(
          // TODO locale
          title: 'Услуга/ Дата',
          backgroundColor: primary,
          summ: 'Сумма',
          mainTextStyle: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Colors.white),
        ),
        BlocBuilder<PurchasedJournalBloc, PurchasedJournalState>(
          builder: (context, state) {
            return Paginator(
              paginatorStatus:
                  MyFunctions.formzStatusToPaginatorStatus(state.status),
              itemBuilder: (context, index) {
                return PurchasedHistoryItem(
                  title: state.journals[index].name,
                  backgroundColor: index % 2 == 0 ? whiteSmoke2 : white,
                  summ: MyFunctions.getFormatCostFromInt(
                      state.journals[index].price.toInt()),
                  purchasedAt: Jiffy(state.journals[index].publishDate)
                      .format('dd.MM.yyyy'),
                );
              },
              itemCount: state.journals.length,
              fetchMoreFunction: () {
                context
                    .read<RestoreBloc>()
                    .add(RestoreEvent.getMoreMyPayHistory());
              },
              hasMoreToFetch: state.next != null,
              errorWidget: Container(),
            );
          },
        ),
      ],
    );
  }
}
