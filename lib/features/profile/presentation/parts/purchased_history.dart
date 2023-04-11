import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/empty_page.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/profile/presentation/blocs/restore/restore_bloc.dart';
import 'package:anatomica/features/profile/presentation/widgets/purchased_history_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

class PurchasedHistoryList extends StatelessWidget {
  const PurchasedHistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestoreBloc, RestoreState>(
      builder: (context, state) {
        return state.myPayments.isNotEmpty
            ? Column(
                children: [
                  PurchasedHistoryItem(
                    title: LocaleKeys.service_date.tr(),
                    backgroundColor: primary,
                    summ: LocaleKeys.amount.tr(),
                    mainTextStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white),
                  ),
                  Paginator(
                    paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(state.myPaymentsStatus),
                    itemBuilder: (context, index) {
                      return PurchasedHistoryItem(
                        title: state.myPayments[index].product,
                        backgroundColor: index % 2 == 0 ? whiteSmoke2 : white,
                        summ: MyFunctions.getFormatCostFromInt(state.myPayments[index].amount),
                        purchasedAt: Jiffy(state.myPayments[index].payedAt).format('dd.MM.yyyy'),
                      );
                    },
                    itemCount: state.myPayments.length,
                    fetchMoreFunction: () {
                      context.read<RestoreBloc>().add(RestoreEvent.getMoreMyPayHistory());
                    },
                    hasMoreToFetch: state.myPaymentsFetchMore,
                    errorWidget: const SizedBox(
                      child: Center(child: CupertinoActivityIndicator(color: Colors.red)),
                    ),
                  ),
                ],
              )
            : EmptyPage(
                title: LocaleKeys.nothing.tr(),
                iconPath: AppIcons.emptyA,
                desc: LocaleKeys.no_purchased_journals.tr(),
              );
      },
    );
  }
}
