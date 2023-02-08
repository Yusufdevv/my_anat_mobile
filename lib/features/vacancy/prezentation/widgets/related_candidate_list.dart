import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/candidate_single/candidate_single_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/candidate_single.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelatedCandidateList extends StatelessWidget {
  final int id;
  final EdgeInsets? margin;

  const RelatedCandidateList(
      {required this.id, this.margin = const EdgeInsets.symmetric(horizontal: 16), Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocBuilder<CandidateSingleBloc, CandidateSingleState>(
      builder: (context, state) {
        return Paginator(
          padding: EdgeInsets.only(bottom: 16 + mediaQuery.padding.bottom),
          paginatorStatus: state.paginatorStatus,
          itemBuilder: (context, index) => CandidateItem(
            candidateListEntity: state.candidateList[index],
            margin: margin,
            onTap: () {
              Navigator.of(context)
                  .push(fade(page: SingleCandidateScreen(id: state.candidateList[index].id)));
            },
          ),
          fetchMoreFunction: () {
            context.read<CandidateSingleBloc>().add(GetMoreRelatedCandidateListEvent(id: id));
          },
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          hasMoreToFetch: state.fetchMore,
          errorWidget: const Center(child: Text('Fail')),
          itemCount: state.candidateList.length,
        );
      },
    );
  }
}
