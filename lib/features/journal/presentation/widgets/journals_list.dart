import 'package:anatomica/features/journal/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/journal/presentation/widgets/journal_small_item.dart';
import 'package:flutter/material.dart';

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
            return MagazineSmallItem(
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
