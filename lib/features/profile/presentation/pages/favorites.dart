import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/data/repository/like_unlike_repository_impl.dart';
import 'package:anatomica/features/common/domain/usecases/like_unlike_doctor_stream_usecase.dart';
import 'package:anatomica/features/common/domain/usecases/like_unlike_vacancy_stream_usecase.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_tab_bar.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/profile/data/repositories/profile_impl.dart';
import 'package:anatomica/features/profile/domain/usecases/get_liked_candidates_usecase.dart';
import 'package:anatomica/features/profile/domain/usecases/get_liked_vacancies_usecase.dart';
import 'package:anatomica/features/profile/presentation/blocs/profile_favourite_bloc/profile_favourite_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/candidate_single.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/vacancy_single.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create: (context) => ProfileFavouriteBloc(
          getLikedCandidatesUseCase: GetLikedCandidatesUseCase(
              repository: serviceLocator<ProfileRepositoryImpl>()),
          getLikedVacanciesUseCase: GetLikedVacanciesUseCase(
              repository: serviceLocator<ProfileRepositoryImpl>()),
          likeUnlikeDoctorStreamUseCase: LikeUnlikeDoctorStreamUseCase(
              repository: serviceLocator<LikeUnlikeRepositoryImpl>()),
          likeUnlikeVacancyStreamUseCase: LikeUnlikeVacancyStreamUseCase(
            repository: serviceLocator<LikeUnlikeRepositoryImpl>(),
          ),
        )
          ..add(GetLikedCandidates())
          ..add(GetLikedVacancies()),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(117),
            child: Column(
              children: [
                WAppBar(title: LocaleKeys.favorite.tr(), hasUnderline: true),
                WTabBar(
                  tabs: [
                    Tab(text: LocaleKeys.vacancy.tr()),
                    Tab(text: LocaleKeys.candidate.tr()),
                  ],
                )
              ],
            ),
          ),
          body: BlocBuilder<ProfileFavouriteBloc, ProfileFavouriteState>(
            builder: (context, state) {
              return TabBarView(
                children: [
                  Paginator(
                    padding: EdgeInsets.only(
                        top: 16, bottom: MediaQuery.of(context).padding.bottom),
                    itemBuilder: (context, index) => VacancyItem(
                      vacancyEntity: state.likedVacancies[index],
                      onTap: () {
                        Navigator.of(context).push(fade(
                            page: VacancySingleScreen(
                                slug: state.likedVacancies[index].slug)));
                      },
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemCount: state.likedVacancies.length,
                    paginatorStatus: state.vacancyStatus,
                    fetchMoreFunction: () {
                      context
                          .read<ProfileFavouriteBloc>()
                          .add(GetMoreLikedVacancies());
                    },
                    emptyWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.emptyA),
                          const SizedBox(height: 24),
                          Text(
                            LocaleKeys.nothing.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 20),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            LocaleKeys.did_not_add_vacancy.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: textSecondary),
                          )
                        ]),
                    hasMoreToFetch: state.vacancyFetchMore,
                    errorWidget: const Text('error'),
                  ),
                  Paginator(
                    padding: const EdgeInsets.only(top: 0),
                    itemBuilder: (context, index) => CandidateItem(
                      candidateListEntity: state.likedCandidates[index],
                      onTap: () {
                        Navigator.of(context).push(fade(
                            page: SingleCandidateScreen(
                                id: state.likedCandidates[index].id)));
                      },
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemCount: state.likedCandidates.length,
                    paginatorStatus: state.candidateStatus,
                    emptyWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.emptyA),
                          const SizedBox(height: 24),
                          Text(
                            LocaleKeys.nothing.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 20),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            LocaleKeys.did_not_add_candidate.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: textSecondary),
                          )
                        ]),
                    fetchMoreFunction: () {
                      context
                          .read<ProfileFavouriteBloc>()
                          .add(GetMoreLikedCandidates());
                    },
                    hasMoreToFetch: state.candidateFetchMore,
                    errorWidget: const Text('error'),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
