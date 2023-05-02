import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/data/repository/like_unlike_repository_impl.dart';
import 'package:anatomica/features/common/domain/usecases/like_unlike_doctor_stream_usecase.dart';
import 'package:anatomica/features/common/domain/usecases/like_unlike_vacancy_stream_usecase.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/vacancy/data/repositories/vacancy_repository_impl.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_list.dart';
import 'package:anatomica/features/vacancy/domain/usecases/vacancy_list.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_search_bloc/vacancy_search_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/candidate_single.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/vacancy_single.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/search_empty.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class VacancySearchScreen extends StatefulWidget {
  final int tabInitialIndex;
  const VacancySearchScreen({required this.tabInitialIndex, Key? key})
      : super(key: key);

  @override
  State<VacancySearchScreen> createState() => _VacancySearchScreenState();
}

class _VacancySearchScreenState extends State<VacancySearchScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  late TextEditingController controller;
  late VacancySearchBloc vacancySearchBloc;
  late FocusNode _focusNode;

  @override
  initState() {
    tabController = TabController(
        length: 2, vsync: this, initialIndex: widget.tabInitialIndex);
    controller = TextEditingController();
    _focusNode = FocusNode()..requestFocus();
    vacancySearchBloc = VacancySearchBloc(
      candidateListUseCase: CandidateListUseCase(
          repository: serviceLocator<VacancyRepositoryImpl>()),
      vacancyListUseCase: VacancyListUseCase(
          repository: serviceLocator<VacancyRepositoryImpl>()),
      likeUnlikeVacancyStreamUseCase: LikeUnlikeVacancyStreamUseCase(
        repository: serviceLocator<LikeUnlikeRepositoryImpl>(),
      ),
      likeUnlikeDoctorStreamUseCase: LikeUnlikeDoctorStreamUseCase(
        repository: serviceLocator<LikeUnlikeRepositoryImpl>(),
      ),
    );
    vacancySearchBloc.add(GetVacancySearchEvent(search: ''));
    vacancySearchBloc.add(GetCandidateSearchEvent(search: ''));
    super.initState();
  }

  @override
  dispose() {
    tabController.dispose();
    controller.dispose();
    vacancySearchBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider.value(
      value: vacancySearchBloc,
      child: KeyboardDismisser(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(148),
            child: Container(
              alignment: Alignment.bottomCenter,
              padding:
                  EdgeInsets.fromLTRB(16, 8 + mediaQuery.padding.top, 16, 12),
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 24,
                    color: woodSmoke.withOpacity(0.12),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SearchField(
                          focusNode: _focusNode,
                          controller: controller,
                          onChanged: (value) {
                            if (tabController.index == 0) {
                              vacancySearchBloc
                                  .add(GetVacancySearchEvent(search: value));
                            } else {
                              vacancySearchBloc
                                  .add(GetCandidateSearchEvent(search: value));
                            }
                          },
                          onClear: () {
                            vacancySearchBloc
                                .add(GetVacancySearchEvent(search: ''));
                            vacancySearchBloc
                                .add(GetCandidateSearchEvent(search: ''));
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      WScaleAnimation(
                        onTap: () {
                          Navigator.of(context).pop(tabController.index);
                        },
                        child: Text(
                          LocaleKeys.cancel.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: textFieldColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(6),
                    margin: const EdgeInsets.only(top: 28),
                    child: TabBar(
                      controller: tabController,
                      padding: EdgeInsets.zero,
                      indicatorPadding: EdgeInsets.zero,
                      indicator: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 8),
                              blurRadius: 24,
                              color: chipShadowColor.withOpacity(0.19),
                            ),
                          ]),
                      labelPadding: EdgeInsets.zero,
                      labelStyle: Theme.of(context).textTheme.displaySmall,
                      labelColor: textColor,
                      onTap: (index) {},
                      unselectedLabelColor: textSecondary,
                      tabs: [
                        Tab(text: LocaleKeys.vacancy.tr()),
                        Tab(text: LocaleKeys.candidate.tr()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              BlocBuilder<VacancySearchBloc, VacancySearchState>(
                builder: (context, state) {
                  return Paginator(
                    padding: EdgeInsets.only(
                        bottom: 50 + mediaQuery.padding.bottom, top: 20),
                    paginatorStatus: state.vacancyPaginatorStatus,
                    errorWidget: const Text('Fail'),
                    emptyWidget: const SearchEmpty(),
                    itemBuilder: (context, index) {
                      return VacancyItem(
                        searchText: controller.text,
                        vacancyEntity: state.vacancyList[index],
                        onTap: () {
                          Navigator.of(context).push(fade(
                              page: VacancySingleScreen(
                                  slug: state.vacancyList[index].slug)));
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    hasMoreToFetch: state.fetchMoreVacancy,
                    fetchMoreFunction: () {},
                    itemCount: state.vacancyList.length,
                  );
                },
              ),
              BlocBuilder<VacancySearchBloc, VacancySearchState>(
                builder: (context, state) {
                  return Paginator(
                    padding: EdgeInsets.only(
                        bottom: 50 + mediaQuery.padding.bottom, top: 20),
                    paginatorStatus: state.candidatePaginatorStatus,
                    errorWidget: const Text('Fail'),
                    emptyWidget: const SearchEmpty(),
                    itemBuilder: (context, index) {
                      return CandidateItem(
                        searchText: controller.text,
                        candidateListEntity: state.candidateList[index],
                        onTap: () {
                          Navigator.of(context).push(fade(
                              page: SingleCandidateScreen(
                            id: state.candidateList[index].id,
                          )));
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    hasMoreToFetch: state.fetchMoreCandidate,
                    fetchMoreFunction: () {},
                    itemCount: state.candidateList.length,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
