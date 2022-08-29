import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_bloc/vacancy_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/candidate_single.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CandidateItemList extends StatelessWidget {
  final EdgeInsets? margin;

  const CandidateItemList({this.margin = const EdgeInsets.symmetric(horizontal: 16), Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocBuilder<VacancyBloc, VacancyState>(
      builder: (context, state) {
        return Paginator(
          padding: EdgeInsets.only(top: 20, bottom: 16 + mediaQuery.padding.bottom),
          paginatorStatus: state.candidatePaginatorStatus,
          itemBuilder: (context, index) => CandidateItem(
            candidateListEntity: state.candidateList[index],
            onTap: () {
              Navigator.of(context)
                  .push(fade(page: SingleCandidateScreen(id: state.candidateList[index].id)));
            },
          ),
          fetchMoreFunction: () {
            context.read<VacancyBloc>().add(GetMoreCandidateList());
          },
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          hasMoreToFetch: state.fetchMoreCandidate,
          errorWidget: const Center(child: Text('Fail')),
          itemCount: state.candidateList.length,
        );
      },
    );
  }
}
