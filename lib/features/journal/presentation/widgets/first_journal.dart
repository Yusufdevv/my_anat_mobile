import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/register_bottom_sheet.dart';
import 'package:anatomica/features/journal/presentation/bloc/download/download_bloc.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/journal/presentation/pages/buy_subscription.dart';
import 'package:anatomica/features/journal/presentation/pages/journal_single_screen.dart';
import 'package:anatomica/features/journal/presentation/widgets/journal_item.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstJournal extends StatelessWidget {
  final JournalState state;

  const FirstJournal({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          children: [
            MagazineItem(
              onLeftButtonTap: () async {
                Navigator.of(context, rootNavigator: true).push(fade(
                    page: JournalSingleScreen(
                        bloc: context.read<JournalBloc>(),
                        journal: state.journals.first,
                        downloadBloc: context.read<DownloadBloc>())));
              },
              onRightButtonTap: () {
                if (context.read<AuthenticationBloc>().state.status == AuthenticationStatus.authenticated) {
                  Navigator.of(context, rootNavigator: true)
                      .push(fade(page: BuySubscription(images: state.journals.map((e) => e.image).toList())));
                } else {
                  showRegisterBottomSheet(context);
                }
              },
              margin: const EdgeInsets.only(right: 16, top: 4),
              journalEntity: state.journals.first,
            ),
          ],
        ),
      ),
    );
  }
}
