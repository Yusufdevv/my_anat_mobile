import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_bloc/vacancy_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/vacancy_single.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VacancyItemList extends StatelessWidget {
  final EdgeInsets? margin;
  final Function(String text) onSuccess;

  const VacancyItemList({this.margin, required this.onSuccess, Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocBuilder<VacancyBloc, VacancyState>(
      builder: (context, state) {
        return Paginator(
          padding: EdgeInsets.only(bottom: 50 + mediaQuery.padding.bottom, top: 20),
          paginatorStatus: state.paginatorStatus,
          errorWidget: const Text('Fail'),
          itemBuilder: (context, index) {
            print('title: ${state.vacancyList[index].organization.title}');
            return VacancyItem(
              onTapFavourite: () {
                print('tap');
                context.read<VacancyBloc>().add(AddWishListVacancyEvent(
                      isFavourite: state.vacancyList[index].isFavorite,
                      vacancy: state.vacancyList[index].id,
                      user: context.read<AuthenticationBloc>().state.user.id,
                      onSuccess: onSuccess,
                      onError: () {
                        print('fail');
                      },
                    ));
              },
              vacancyEntity: state.vacancyList[index],
              onTap: () {
                Navigator.of(context)
                    .push(fade(page: VacancySingleScreen(slug: state.vacancyList[index].slug)));
              },
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          hasMoreToFetch: state.fetchMore,
          fetchMoreFunction: () {
            context.read<VacancyBloc>().add(GetMoreVacancyListEvent());
          },
          itemCount: state.vacancyList.length,
        );
      },
    );
  }
}
