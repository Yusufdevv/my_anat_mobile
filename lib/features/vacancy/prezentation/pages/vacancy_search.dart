import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/default_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/common/presentation/widgets/w_tab_bar.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/vacancy/data/repositories/vacancy_repository_impl.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_list.dart';
import 'package:anatomica/features/vacancy/domain/usecases/vacancy_list.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_search_bloc/vacancy_search_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/vacancy_single.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/search_empty.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class VacancySearchScreen extends StatefulWidget {
  const VacancySearchScreen({Key? key}) : super(key: key);

  @override
  State<VacancySearchScreen> createState() => _VacancySearchScreenState();
}

class _VacancySearchScreenState extends State<VacancySearchScreen> with TickerProviderStateMixin {
  late TabController tabController;
  late TextEditingController controller;
  late VacancySearchBloc vacancySearchBloc;

  @override
  initState() {
    tabController = TabController(length: 2, vsync: this);
    controller = TextEditingController();
    vacancySearchBloc = VacancySearchBloc(
        candidateListUseCase: CandidateListUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
        vacancyListUseCase: VacancyListUseCase(repository: serviceLocator<VacancyRepositoryImpl>()));
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
            preferredSize: const Size.fromHeight(132),
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 8 + mediaQuery.padding.top, 16, 16),
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
                children: [
                  Row(
                    children: [
                      WScaleAnimation(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          LocaleKeys.cancel.tr(),
                          style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DefaultTextField(
                          controller: controller,
                          height: 40,
                          onChanged: (value) {
                            if (tabController.index == 0) {
                              vacancySearchBloc.add(GetVacancySearchEvent(search: value));
                            } else {
                              vacancySearchBloc.add(GetCandidateSearchEvent(search: value));
                            }
                          },
                          suffix: WScaleAnimation(
                            onTap: () {
                              setState(() {
                                controller.clear();
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SvgPicture.asset(AppIcons.x),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  WTabBar(
                    tabController: tabController,
                    tabs: [
                      Tab(text: LocaleKeys.vacancy.tr()),
                      Tab(text: LocaleKeys.candidate.tr()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              // BlocBuilder<VacancySearchBloc, VacancySearchState>(
              //   builder: (context, state) {
              //     return Padding(
              //       padding: const EdgeInsets.fromLTRB(16, 29, 0, 16),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           const VacancyTitleText(title: 'Популярные запросы'),
              //           const WDivider(margin: EdgeInsets.symmetric(vertical: 13)),
              //           Container(
              //             color: white,
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 ...List.generate(
              //                     3, (index) => SearchItem(isLast: index == 2 ? true : false)),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),
              BlocBuilder<VacancySearchBloc, VacancySearchState>(
                builder: (context, state) {
                  print('state:${state.vacancyPaginatorStatus}');
                  return Paginator(
                    padding: EdgeInsets.only(bottom: 50 + mediaQuery.padding.bottom, top: 20),
                    paginatorStatus: state.vacancyPaginatorStatus,
                    errorWidget: const Text('Fail'),
                    itemBuilder: (context, index) {
                      if (state.vacancyList.isEmpty) {
                        return const Center(child: SearchEmpty());
                      }
                      print('title: ${state.vacancyList[index].organization.title}');
                      return VacancyItem(
                        vacancyEntity: state.vacancyList[index],
                        onTap: () {
                          Navigator.of(context)
                              .push(fade(page: VacancySingleScreen(slug: state.vacancyList[index].slug)));
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    hasMoreToFetch: state.fetchMoreVacancy,
                    fetchMoreFunction: () {},
                    itemCount: state.vacancyList.length,
                  );
                },
              ),
              BlocBuilder<VacancySearchBloc, VacancySearchState>(
                builder: (context, state) {
                  print('state:${state.candidatePaginatorStatus}');
                  return Paginator(
                    padding: EdgeInsets.only(bottom: 50 + mediaQuery.padding.bottom, top: 20),
                    paginatorStatus: state.candidatePaginatorStatus,
                    errorWidget: const Text('Fail'),
                    itemBuilder: (context, index) {
                      if (state.candidateList.isEmpty) {
                        return const Center(child: SearchEmpty());
                      }

                      return CandidateItem(
                        candidateListEntity: state.candidateList[index],
                        onTap: () {
                          Navigator.of(context)
                              .push(fade(page: VacancySingleScreen(slug: state.vacancyList[index].slug)));
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
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
