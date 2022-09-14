import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_bloc/vacancy_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/vacancy_single.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_card.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VacancyCardList extends StatelessWidget {
  const VacancyCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VacancyBloc, VacancyState>(
      builder: (context, state) {
        return SizedBox(
          height: 131,
          child: Paginator(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => VacancyCard(
              onTap: () {
                Navigator.of(context).push(
                  fade(
                    page: VacancySingleScreen(
                      slug: state.organizationVacancyList[index].slug,
                    ),
                  ),
                );
              },
              vacancyListEntity: state.organizationVacancyList[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemCount: state.organizationVacancyList.length,
            errorWidget: const Center(child: Text('Fail')),
            fetchMoreFunction: () {
              context.read<VacancyBloc>().add(GetMoreOrganizationVacancyEvent());
            },
            paginatorStatus: state.paginatorStatusOrganization,
            hasMoreToFetch: state.fetchMoreOrganization,
            loadingWidget: const VacancyCardShimmer(),
          ),
        );
      },
    );
  }
}
