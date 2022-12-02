import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_bloc/vacancy_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/vacancy_single.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VacancyItemList extends StatelessWidget {
  final EdgeInsets? margin;

  final Function(String text) onSuccess;

  const VacancyItemList({this.margin, Key? key, required this.onSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocBuilder<VacancyBloc, VacancyState>(
      builder: (context, state) {
        return Paginator(
          padding: EdgeInsets.only(bottom: 50 + mediaQuery.padding.bottom),
          paginatorStatus: state.paginatorStatus,
          errorWidget: const Text('Fail'),
          itemBuilder: (context, index) {
            return VacancyItem(
              vacancyEntity: state.vacancyList[index],
              onTap: () {
                Navigator.of(context).push(fade(page: VacancySingleScreen(slug: state.vacancyList[index].slug)));
              },
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          hasMoreToFetch: state.fetchMore,
          emptyWidget: SingleChildScrollView(
            child: EmptyWidget(
              title: LocaleKeys.no_vacancies.tr(),
              content: LocaleKeys.no_vacancies.tr(),
            ),
          ),
          fetchMoreFunction: () {
            context.read<VacancyBloc>().add(GetMoreVacancyListEvent());
          },
          itemCount: state.vacancyList.length,
        );
      },
    );
  }
}
