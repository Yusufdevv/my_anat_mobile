import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/data/repository/like_unlike_repository_impl.dart';
import 'package:anatomica/features/common/domain/usecases/like_unlike_doctor_stream_usecase.dart';
import 'package:anatomica/features/common/domain/usecases/like_unlike_vacancy_stream_usecase.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/sliver_tab_bardelegate.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/common/presentation/widgets/w_tab_bar.dart';
import 'package:anatomica/features/vacancy/data/repositories/vacancy_repository_impl.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_list.dart';
import 'package:anatomica/features/vacancy/domain/usecases/category_list.dart';
import 'package:anatomica/features/vacancy/domain/usecases/district.dart';
import 'package:anatomica/features/vacancy/domain/usecases/organization_vacancy.dart';
import 'package:anatomica/features/vacancy/domain/usecases/region.dart';
import 'package:anatomica/features/vacancy/domain/usecases/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/usecases/vacancy_filter.dart';
import 'package:anatomica/features/vacancy/domain/usecases/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/usecases/vacancy_option.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/region_bloc/region_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_bloc/vacancy_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_item_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/company_card.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/filter_bottom_sheet.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/filter_card_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/filtr_container.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_appbar.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_card_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item_list.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VacancyScreen extends StatefulWidget {
  const VacancyScreen({Key? key}) : super(key: key);

  @override
  State<VacancyScreen> createState() => _VacancyScreenState();
}

class _VacancyScreenState extends State<VacancyScreen> with TickerProviderStateMixin {
  late TabController tabController;
  bool hasFilter = false;
  late VacancyBloc vacancyBloc;
  late RegionBloc regionBloc;

  @override
  initState() {
    tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {});
      });
    vacancyBloc = VacancyBloc(
      vacancyFilterUseCase: VacancyFilterUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
      categoryListUseCase: CategoryListUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
      candidateListUseCase: CandidateListUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
      vacancyOptionUseCase: VacancyOptionUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
      organizationVacancyUseCase: OrganizationVacancyUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
      vacancyListUseCase: VacancyListUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
      topOrganizationUseCase: TopOrganizationUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
      likeUnlikeVacancyStreamUseCase:
          LikeUnlikeVacancyStreamUseCase(repository: serviceLocator<LikeUnlikeRepositoryImpl>()),
      likeUnlikeDoctorStreamUseCase:
          LikeUnlikeDoctorStreamUseCase(repository: serviceLocator<LikeUnlikeRepositoryImpl>()),
    );
    regionBloc = RegionBloc(
        districtUseCase: DistrictUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
        regionUseCase: RegionUseCase(repository: serviceLocator<VacancyRepositoryImpl>()));
    vacancyBloc.add(GetVacancyListEvent(onSuccess: () {}));
    vacancyBloc.add(GetTopOrganizationEvent());
    vacancyBloc.add(GetCandidateListEvent());
    vacancyBloc.add(GetCategoryListEvent());

    super.initState();
  }

  bool isStarted = false;

  @override
  dispose() {
    tabController.dispose();
    vacancyBloc.close();
    regionBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: vacancyBloc),
      ],
      child: CustomScreen(
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
                BlocBuilder<VacancyBloc, VacancyState>(
                  builder: (context, state) {
                    return SliverPersistentHeader(
                      pinned: false,
                      delegate: SliverTabBarDelegate(
                        height: state.organizationVacancyList.isEmpty ? 126 : 280,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 24),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16, bottom: 12),
                                  child: Text(
                                    LocaleKeys.vacancy_company.tr(),
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
                                      state.organizationVacancyList.isEmpty
                                          ? const SizedBox()
                                          : Container(
                                              margin: const EdgeInsets.symmetric(vertical: 10),
                                              child: const WDivider(),
                                            ),
                                      Stack(
                                        children: [
                                          state.organizationVacancyList.isEmpty
                                              ? const SizedBox()
                                              : const VacancyCardList(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ];
            },
            body: Column(
              children: [
                WTabBar(
                  tabController: tabController,
                  tabs: [
                    Text(LocaleKeys.vacancy.tr()),
                    Text(LocaleKeys.candidate.tr()),
                  ],
                ),
                const SizedBox(height: 16),
                FilterContainer(
                  onTap: () {
                    showFilterBottomSheet(context, regionBloc, vacancyBloc, tabController.index != 1);
                  },
                ),
                const SizedBox(height: 20),
                hasFilter ? const FilterCardList() : const SizedBox(),
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    controller: tabController,
                    children: [
                      VacancyItemList(
                        onSuccess: (text) {
                          context.read<ShowPopUpBloc>().add(ShowPopUp(message: text));
                        },
                      ),
                      const CandidateItemList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
