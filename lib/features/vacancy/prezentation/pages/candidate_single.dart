import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/rating_container.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/map/presentation/blocs/header_manager_bloc/header_manager_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/tab_bar_header_delegate.dart';
import 'package:anatomica/features/vacancy/data/repositories/vacancy_repository_impl.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_single.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/candidate_single/candidate_single_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_contact_info.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_item_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/education_item_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/experience_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/licence_item_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_title_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class SingleCandidateScreen extends StatefulWidget {
  final int id;

  const SingleCandidateScreen({required this.id, Key? key}) : super(key: key);

  @override
  State<SingleCandidateScreen> createState() => _SingleCandidateScreenState();
}

class _SingleCandidateScreenState extends State<SingleCandidateScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  late HeaderManagerBloc _headerManagerBloc;
  late CandidateSingleBloc _candidateSingleBloc;
  late PageController _pageController;
  int currentImage = 0;
  final tabs = [
    'О кандидате',
    'Образование',
    'Лицензии и сертификаты',
    'Контактные данные',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
    _headerManagerBloc = HeaderManagerBloc();
    _pageController = PageController();
    _scrollController.addListener(_scrollListener);
    _candidateSingleBloc = CandidateSingleBloc(
        candidateSingleUseCase:
            CandidateSingleUseCase(repository: serviceLocator<VacancyRepositoryImpl>()));
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _candidateSingleBloc.close();
    super.dispose();
  }

  _scrollListener() {
    _headerManagerBloc.add(ChangeHeaderScrollPosition(headerPosition: _scrollController.offset));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _candidateSingleBloc),
      ],
      child: Scaffold(
        body: BlocBuilder<CandidateSingleBloc, CandidateSingleState>(
          builder: (context, state) {
            if (state.status.isPure) {
              context.read<CandidateSingleBloc>().add(GetCandidateSingleEvent(id: widget.id));
            } else if (state.status.isSubmissionInProgress) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state.status.isSubmissionFailure) {
              return const Center(child: Text('Fail'));
            } else if (state.status.isSubmissionSuccess) {
              return NestedScrollView(
                floatHeaderSlivers: false,
                controller: _scrollController,
                headerSliverBuilder: (context, isHeaderScrolled) => [
                  BlocProvider.value(
                    value: _headerManagerBloc,
                    child: BlocBuilder<HeaderManagerBloc, HeaderManagerState>(
                      builder: (context, headerManageState) {
                        return SliverOverlapAbsorber(
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                          sliver: SliverSafeArea(
                            top: false,
                            bottom: false,
                            sliver: SliverAppBar(
                              title: headerManageState.isHeaderScrolled
                                  ? Container(
                                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                                      width: double.infinity,
                                      color: darkGreen,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.candidate.fullName,
                                            style:
                                                Theme.of(context).textTheme.headline2!.copyWith(),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(state.candidate.position.title,
                                              style:
                                                  Theme.of(context).textTheme.headline2!.copyWith())
                                        ],
                                      ),
                                    )
                                  : Container(),
                              shadowColor: textFieldColor,
                              stretch: true,
                              expandedHeight: 496,
                              titleSpacing: 0,
                              leadingWidth: 0,
                              elevation: 1,
                              pinned: true,
                              floating: true,
                              automaticallyImplyLeading: false,
                              backgroundColor: white,
                              systemOverlayStyle:
                                  const SystemUiOverlayStyle(statusBarColor: darkGreen),
                              collapsedHeight: 56,
                              flexibleSpace: FlexibleSpaceBar(
                                stretchModes: const [StretchMode.blurBackground],
                                background: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Positioned.fill(
                                      bottom: 178,
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                            child: Stack(
                                              children: [
                                                Positioned.fill(
                                                  child: CachedNetworkImage(
                                                    height: 277,
                                                    imageUrl: state.candidate.img.middle,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Positioned.fill(
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        begin: Alignment.topCenter,
                                                        end: Alignment.bottomCenter,
                                                        colors: [
                                                          darkGreen.withOpacity(0),
                                                          darkGreen,
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            left: 16,
                                            right: 16,
                                            bottom: 46,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state.candidate.fullName,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1!
                                                      .copyWith(color: white, fontSize: 22),
                                                ),
                                                const SizedBox(height: 16),
                                                Container(
                                                  padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
                                                  decoration: BoxDecoration(
                                                    color: white.withOpacity(0.12),
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(color: primary),
                                                  ),
                                                  child: Text(
                                                    state.candidate.position.title,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline3!
                                                        .copyWith(color: white),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          // Positioned.fill(
                                          //   child: Container(
                                          //
                                          //   ),
                                          // ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: MediaQuery.of(context).padding.top),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                WScaleAnimation(
                                                  onTap: () => Navigator.of(context).pop(),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(16),
                                                    child: SvgPicture.asset(
                                                      AppIcons.chevronRight,
                                                      color: white,
                                                    ),
                                                  ),
                                                ),
                                                WScaleAnimation(
                                                  onTap: () {},
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(16),
                                                    child: SvgPicture.asset(
                                                      AppIcons.share,
                                                      color: white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(16),
                                          ),
                                          color: white,
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 20, horizontal: 16),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(AppIcons.location),
                                                      const SizedBox(width: 6),
                                                      Text(
                                                        state.candidate.address,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline3!
                                                            .copyWith(color: textColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(AppIcons.phone),
                                                      const SizedBox(width: 6),
                                                      Text(
                                                        state.candidate.phoneNumber,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline3!
                                                            .copyWith(color: textColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(AppIcons.building),
                                                      const SizedBox(width: 6),
                                                      Text(
                                                        'Doctor-D',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline3!
                                                            .copyWith(color: textColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        state.candidate.rating.toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline3!
                                                            .copyWith(color: darkGreen),
                                                      ),
                                                      const SizedBox(width: 8),
                                                      RatingStars(
                                                        rate: state.candidate.rating,
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(height: 16),
                                                  WButton(
                                                    color: primary,
                                                    onTap: () {},
                                                    padding: EdgeInsets.zero,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          AppIcons.phone,
                                                          height: 20,
                                                          width: 20,
                                                          color: white,
                                                        ),
                                                        const SizedBox(width: 8),
                                                        Text(
                                                          'Позвонть',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .headline3!
                                                              .copyWith(color: white),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                                height: 0, thickness: 1, color: textFieldColor)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SliverOverlapAbsorber(
                    handle: SliverOverlapAbsorberHandle(),
                    sliver: SliverSafeArea(
                      top: false,
                      bottom: false,
                      sliver: SliverPersistentHeader(
                        pinned: true,
                        delegate: TabBarHeaderDelegate(
                          tabController: _tabController,
                          tabs: tabs,
                        ),
                      ),
                    ),
                  )
                ],
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 16 + mediaQuery.padding.bottom),
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(width: 1, color: lilyWhite),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const VacancyTitleText(title: 'Обо мне', fontSize: 18),
                              const SizedBox(height: 8),
                              Text(
                                state.candidate.bio,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 13,
                                      color: montana,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.only(left: 16, bottom: 12),
                          child: VacancyTitleText(title: 'Опыт работы', fontSize: 18),
                        ),
                        const ExperienceItem(),
                        const SizedBox(height: 12),
                        const ExperienceItem(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 24, 0, 16),
                          child: Text(
                            'Похожие кандидаты',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        //  const CandidateItemList(),
                      ],
                    ),
                    ListView(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + mediaQuery.padding.bottom),
                      children: const [
                        EducationItemList(),
                        SizedBox(height: 24),
                        VacancyTitleText(title: 'Похожие кандидаты', fontSize: 18),
                        // CandidateItemList(margin: EdgeInsets.zero),
                      ],
                    ),
                    ListView(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + mediaQuery.padding.bottom),
                      children: const [
                        LicenceItemList(),
                        SizedBox(height: 24),
                        VacancyTitleText(title: 'Похожие кандидаты', fontSize: 18),
                        //   CandidateItemList(margin: EdgeInsets.zero),
                      ],
                    ),
                    CandidateContactInfo(candidate: state.candidate),
                  ],
                ),
              );
            }
            return const Center(child: CupertinoActivityIndicator());
          },
        ),
      ),
    );
  }
}
