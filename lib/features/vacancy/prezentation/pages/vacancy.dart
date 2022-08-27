import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/sliver_tab_bardelegate.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/common/presentation/widgets/w_tab_bar.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/vacancy/data/repositories/vacancy_repository_impl.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_list.dart';
import 'package:anatomica/features/vacancy/domain/usecases/category_list.dart';
import 'package:anatomica/features/vacancy/domain/usecases/organization_vacancy.dart';
import 'package:anatomica/features/vacancy/domain/usecases/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/usecases/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/usecases/vacancy_option.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_bloc/vacancy_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/vacancy_single.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_item_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/category_container.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/company_card.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/filter_bottom_sheet.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/filter_card.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/filter_card_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/filtr_container.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_appbar.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_card.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_card_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_tab_bar.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class VacancyScreen extends StatefulWidget {
  const VacancyScreen({Key? key}) : super(key: key);

  @override
  State<VacancyScreen> createState() => _VacancyScreenState();
}

class _VacancyScreenState extends State<VacancyScreen> with TickerProviderStateMixin {
  late TabController tabController;
  bool hasFilter = false;
  List<String> categoryList = ['Стоматолог', 'Кардиолог', 'Терапевт', 'Пулмонолг'];
  late VacancyBloc vacancyBloc;

  @override
  initState() {
    tabController = TabController(length: 2, vsync: this);
    vacancyBloc = VacancyBloc(
      categoryListUseCase: CategoryListUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
      candidateListUseCase:
          CandidateListUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
      vacancyOptionUseCase:
          VacancyOptionUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
      organizationVacancyUseCase:
          OrganizationVacancyUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
      vacancyListUseCase: VacancyListUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
      topOrganizationUseCase:
          TopOrganizationUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
    );
    vacancyBloc.add(GetVacancyListEvent());
    vacancyBloc.add(GetTopOrganizationEvent());
    vacancyBloc.add(GetCandidateListEvent());
    vacancyBloc.add(GetCategoryListEvent());

    super.initState();
  }

  @override
  dispose() {
    tabController.dispose();
    vacancyBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: vacancyBloc),
      ],
      child: Scaffold(
        backgroundColor: white,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: VacancyAppBar(),
        ),
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, item) {
            return [
              SliverPersistentHeader(
                pinned: false,
                delegate: SliverTabBarDelegate(
                  height: 359,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 12, top: 16),
                        child: Text(
                          'Категории',
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      BlocBuilder<VacancyBloc, VacancyState>(
                        builder: (context, state) {
                          // if(state.categoryStatus.isSubmissionInProgress){
                          //   return Lis
                          // }
                          return SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                ...List.generate(
                                  state.categoryList.length,
                                  (index) => CategoryContainer(
                                    title: state.categoryList[index].title,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      //    const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 12),
                        child: Text(
                          'Топ вакансии от компании',
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1, color: pattensBlue),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: CompanyCard(vacancyBloc: vacancyBloc),
                            ),
                            const SizedBox(height: 10),
                            const WDivider(),
                            const SizedBox(height: 10),
                            Stack(
                              children: [
                                VacancyCardList(onTap: () {
                                  // Navigator.of(context)
                                  //     .push(fade(page: const VacancySingleScreen()));
                                }),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 145,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          white.withOpacity(0),
                                          white,
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ];
          },
          body: Column(
            children: [
              WTabBar(
                tabController: tabController,
                tabs: const [
                  Text('Вакансии'),
                  Text('Кандидаты'),
                ],
              ),
              const SizedBox(height: 16),
              FilterContainer(
                onTap: () {
                  showFilterBottomSheet(context);
                },
              ),
              // const SizedBox(height: 20),
              hasFilter ? const FilterCardList() : const SizedBox(),
              Expanded(
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  controller: tabController,
                  children: const [
                    VacancyItemList(),
                    CandidateItemList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}