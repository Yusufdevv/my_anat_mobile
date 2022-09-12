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
import 'package:anatomica/features/vacancy/prezentation/pages/vacancy_single.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileFavouriteBloc(
        getLikedCandidatesUseCase: GetLikedCandidatesUseCase(repository: serviceLocator<ProfileRepositoryImpl>()),
        getLikedVacanciesUseCase: GetLikedVacanciesUseCase(repository: serviceLocator<ProfileRepositoryImpl>()),
        likeUnlikeDoctorStreamUseCase:
            LikeUnlikeDoctorStreamUseCase(repository: serviceLocator<LikeUnlikeRepositoryImpl>()),
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
                tabController: tabController,
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
              controller: tabController,
              children: [
                Paginator(
                  padding: EdgeInsets.only(top: 16, bottom: MediaQuery.of(context).padding.bottom),
                  itemBuilder: (context, index) => VacancyItem(
                    vacancyEntity: state.likedVacancies[index],
                    onTap: () {
                      Navigator.of(context)
                          .push(fade(page: VacancySingleScreen(slug: state.likedVacancies[index].slug)));
                    },
                  ),
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemCount: state.likedVacancies.length,
                  paginatorStatus: state.vacancyStatus,
                  fetchMoreFunction: () {
                    context.read<ProfileFavouriteBloc>().add(GetMoreLikedVacancies());
                  },
                  hasMoreToFetch: state.vacancyFetchMore,
                  errorWidget: const Text('error'),
                ),
                ListView.separated(
                  padding: const EdgeInsets.only(top: 0),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => SizedBox(),
                  //     CandidateItem(
                  //   onTap: () {
                  //     Navigator.of(context).push(fade(page: const CandidateSingleScreen()));
                  //   },
                  // ),
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemCount: 10,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
