import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/magazine/presentation/pages/magazine_single_item.dart';
import 'package:anatomica/features/magazine/presentation/pages/onetime_payment.dart';
import 'package:anatomica/features/magazine/presentation/widgets/journal_small_item.dart';
import 'package:anatomica/features/magazine/presentation/widgets/purchase_bottom_sheet.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JournalsList extends StatelessWidget {
  final JournalState state;
  const JournalsList({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 20,
          mainAxisExtent: 370,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final journal = state.journals.skip(1).take(4).toList()[index];
            return MagazineSmallItem(
              onTap: () {
                if (journal.isBought) {
                  Navigator.push(
                    context,
                    fade(
                      page: MagazineSingleItem(
                        bloc: context.read<JournalBloc>(),
                        journal: state.journals.skip(1).take(4).toList()[index],
                      ),
                    ),
                  );
                } else {
                  showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (_) {
                      return PurchaseBottomSheet(
                          amount: journal.price,
                          onButtonTap: () {
                            Navigator.of(_).pop();
                            if (context.read<AuthenticationBloc>().state.status ==
                                AuthenticationStatus.authenticated) {}
                            Navigator.of(context).push(fade(
                                page: OneTimePayment(
                                    price: journal.price,
                                    title: journal.name,
                                    imageUrl: journal.image.middle,
                                    isJournal: false,
                                    isRegistered: context.read<AuthenticationBloc>().state.status ==
                                        AuthenticationStatus.authenticated,
                                    subtitle: journal.redaction,
                                    id: journal.id)));
                          });
                    },
                  );
                }
              },
              margin: const EdgeInsets.only(top: 20),
              journalEntity: state.journals.skip(1).take(4).toList()[index],
            );
          },
          childCount: state.journals.skip(1).take(4).length,
        ),
      ),
    );
  }
}
