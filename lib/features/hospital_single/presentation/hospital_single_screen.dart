import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_comforts.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_comments.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_services.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_single_hospital.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_specialists.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_vacancies.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/comments/comments_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/facilities/facilities_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/h_articles/h_articles_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/hospital_single/hospital_single_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/hospital_specialist/hospital_specialist_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/services/services_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/vacancies/hospital_vacancies_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/comment_list.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_articles.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_comments.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_conditions.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_contacts.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_sevices.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_specialists.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_vacancies.dart';
import 'package:anatomica/features/map/presentation/blocs/header_manager_bloc/header_manager_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:anatomica/features/map/presentation/widgets/image_slider_indicator.dart';
import 'package:anatomica/features/map/presentation/widgets/tab_bar_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class HospitalSingleScreen extends StatefulWidget {
  final String slug;

  const HospitalSingleScreen({required this.slug, Key? key}) : super(key: key);

  @override
  State<HospitalSingleScreen> createState() => _HospitalSingleScreenState();
}

class _HospitalSingleScreenState extends State<HospitalSingleScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  late HeaderManagerBloc _headerManagerBloc;
  late PageController _pageController;
  late HospitalSingleBloc hospitalSingleBloc;
  late CommentsBloc commentsBloc;
  late ServicesBloc servicesBloc;
  late HospitalSpecialistBloc hospitalSpecialistBloc;
  late FacilitiesBloc facilitiesBloc;
  late HArticlesBloc articlesBloc;
  late HospitalVacanciesBloc vacanciesBloc;

  int currentImage = 0;
  final tabs = [
    'О клинике',
    'Услуги',
    'Специалисты',
    'Удобства',
    'Статьи',
    'Отзывы',
    'Вакансии',
    'Контакты',
  ];

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    vacanciesBloc = HospitalVacanciesBloc(GetHospitalVacancies())
      ..add(HospitalVacanciesEvent.getVacancies());
    articlesBloc = HArticlesBloc(GetHArticlesUseCase())
      ..add(HArticlesEvent.getArticles());
    facilitiesBloc = FacilitiesBloc(GetComfortsUseCase())
      ..add(FacilitiesEvent.getFacilities());
    hospitalSpecialistBloc = HospitalSpecialistBloc(GetSpecialistsUseCase())
      ..add(HospitalSpecialistEvent.getSpecialists());
    servicesBloc = ServicesBloc(GetServicesUseCase())
      ..add(ServicesEvent.getComments());
    super.initState();
    commentsBloc = CommentsBloc(GetCommentsUseCase())
      ..add(CommentsEvent.getComments());
    hospitalSingleBloc = HospitalSingleBloc(GetSingleHospitalUseCase())
      ..add(HospitalSingleEvent.getHospital(widget.slug));
    _tabController = TabController(length: 8, vsync: this);
    _scrollController = ScrollController();
    _headerManagerBloc = HeaderManagerBloc();
    _pageController = PageController();
    _scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    _headerManagerBloc.add(
        ChangeHeaderScrollPosition(headerPosition: _scrollController.offset));
  }

  @override
  Widget build(BuildContext context) {
    return WKeyboardDismisser(
      child: Scaffold(
        body: BlocProvider.value(
          value: hospitalSingleBloc,
          child: NestedScrollView(
            floatHeaderSlivers: false,
            controller: _scrollController,
            headerSliverBuilder: (context, isHeaderScrolled) => [
              BlocProvider.value(
                value: _headerManagerBloc,
                child: BlocBuilder<HeaderManagerBloc, HeaderManagerState>(
                  builder: (context, state) {
                    return SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: SliverSafeArea(
                        top: false,
                        bottom: false,
                        sliver: SliverAppBar(
                          title: state.isHeaderScrolled
                              ? const HospitalSingleAppBarBody()
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
                          collapsedHeight: 56,
                          flexibleSpace: FlexibleSpaceBar(
                            stretchModes: const [
                              StretchMode.blurBackground,
                            ],
                            background: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Positioned.fill(
                                  bottom: 219,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: BlocBuilder<HospitalSingleBloc,
                                            HospitalSingleState>(
                                          builder: (context, state) {
                                            return PageView.builder(
                                              itemBuilder: (context, index) =>
                                                  Stack(
                                                children: [
                                                  Positioned.fill(
                                                    child: Image.network(
                                                      state.hospital
                                                          .images[index].middle,
                                                      fit: BoxFit.cover,
                                                      height: 277,
                                                    ),
                                                  ),
                                                  Positioned.fill(
                                                      child: Container(
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          textColor.withOpacity(
                                                              0.48),
                                                          textColor.withOpacity(
                                                              0.24),
                                                        ],
                                                      ),
                                                    ),
                                                  ))
                                                ],
                                              ),
                                              itemCount:
                                                  state.hospital.images.length,
                                              controller: _pageController,
                                              onPageChanged: (index) {
                                                setState(() {
                                                  currentImage = index;
                                                });
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                .padding
                                                .top),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            WScaleAnimation(
                                              onTap: () =>
                                                  Navigator.of(context).pop(),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: SvgPicture.asset(
                                                  AppIcons.chevronRight,
                                                  color: white,
                                                ),
                                              ),
                                            ),
                                            WScaleAnimation(
                                              onTap: () {},
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: SvgPicture.asset(
                                                  AppIcons.share,
                                                  color: white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      BlocBuilder<HospitalSingleBloc,
                                          HospitalSingleState>(
                                        builder: (context, state) {
                                          return state.hospital.images.length >
                                                  1
                                              ? Positioned(
                                                  left: 0,
                                                  right: 0,
                                                  bottom: 32,
                                                  child: ImageSliderIndicator(
                                                    itemCount: state
                                                        .hospital.images.length,
                                                    currentIndex: currentImage,
                                                  ),
                                                )
                                              : const SizedBox();
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  child: BlocBuilder<HospitalSingleBloc,
                                      HospitalSingleState>(
                                    builder: (context, state) {
                                      return Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(16),
                                          ),
                                          color: white,
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 16),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 40,
                                                        width: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          border: Border.all(
                                                              color: divider),
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                                state
                                                                    .hospital
                                                                    .icon
                                                                    .middle),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 12),
                                                      Expanded(
                                                        child: Text(
                                                          state.hospital.name,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          20),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          AppIcons.location),
                                                      const SizedBox(width: 6),
                                                      Text(
                                                        state.hospital.address,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline3,
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  state.hospital.phone.isEmpty
                                                      ? const SizedBox()
                                                      : Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 16),
                                                          child: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                  AppIcons
                                                                      .phone),
                                                              const SizedBox(
                                                                  width: 6),
                                                              Text(
                                                                state.hospital
                                                                    .phone,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline3,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        state.hospital.rating
                                                            .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline3!
                                                            .copyWith(
                                                                color:
                                                                    darkGreen),
                                                      ),
                                                      const SizedBox(width: 8),
                                                      ...List.generate(
                                                        state.hospital.rating
                                                            .truncate(),
                                                        (index) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 4),
                                                          child:
                                                              SvgPicture.asset(
                                                                  AppIcons
                                                                      .star),
                                                        ),
                                                      ),
                                                      ...List.generate(
                                                        5 -
                                                            state
                                                                .hospital.rating
                                                                .truncate(),
                                                        (index) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 4),
                                                          child: SvgPicture.asset(
                                                              AppIcons.star,
                                                              color:
                                                                  inactiveStar),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: WButton(
                                                          color: primary,
                                                          onTap: () async {
                                                            if (state
                                                                .hospital
                                                                .phone
                                                                .isNotEmpty) {
                                                              await canLaunchUrl(
                                                                      Uri.parse(
                                                                          'tel:${state.hospital.phone}'))
                                                                  ? await launchUrl(
                                                                      Uri.parse(
                                                                          'tel:${state.hospital.phone}'))
                                                                  : throw 'Can not open phone number';
                                                            }
                                                          },
                                                          padding:
                                                              EdgeInsets.zero,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SvgPicture.asset(
                                                                AppIcons.phone,
                                                                height: 20,
                                                                width: 20,
                                                                color: white,
                                                              ),
                                                              const SizedBox(
                                                                  width: 8),
                                                              Text(
                                                                LocaleKeys.call
                                                                    .tr(),
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline3!
                                                                    .copyWith(
                                                                        color:
                                                                            white),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 8),
                                                      Expanded(
                                                        child: WButton(
                                                          color: white,
                                                          onTap: () async {
                                                            await canLaunchUrl(
                                                                    Uri.parse(
                                                                        'geo:${state.hospital.location.lat},${state.hospital.location.long}'))
                                                                ? await launchUrl(
                                                                    Uri.parse(
                                                                        'geo:${state.hospital.location.lat},${state.hospital.location.long}'))
                                                                : throw 'Can not open location';
                                                          },
                                                          padding:
                                                              EdgeInsets.zero,
                                                          border: Border.all(
                                                              color: primary),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SvgPicture.asset(
                                                                AppIcons
                                                                    .mapRoute,
                                                                height: 20,
                                                                width: 20,
                                                              ),
                                                              const SizedBox(
                                                                  width: 8),
                                                              Text(
                                                                LocaleKeys.get
                                                                    .tr(),
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline3!
                                                                    .copyWith(
                                                                        color:
                                                                            primary),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                                height: 0,
                                                thickness: 1,
                                                color: textFieldColor)
                                          ],
                                        ),
                                      );
                                    },
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
                BlocBuilder<HospitalSingleBloc, HospitalSingleState>(
                  builder: (context, state) {
                    return BlocProvider.value(
                      value: commentsBloc,
                      child: HospitalCommentList(
                        description: state.hospital.description,
                        onTapAll: () {
                          _tabController.animateTo(
                            5,
                            duration: const Duration(milliseconds: 150),
                          );
                        },
                      ),
                    );
                  },
                ),
                BlocProvider.value(
                    value: servicesBloc, child: const HospitalServices()),
                BlocProvider.value(
                    value: hospitalSpecialistBloc,
                    child: const HospitalSpecialists()),
                BlocProvider.value(
                    value: facilitiesBloc, child: const HospitalConditions()),
                BlocProvider.value(
                    value: articlesBloc, child: const HospitalArticles()),
                BlocProvider.value(
                    value: commentsBloc,
                    child: HospitalComments(
                      overallRating: hospitalSingleBloc.state.hospital.rating,
                    )),
                BlocProvider.value(
                    value: vacanciesBloc, child: const HospitalVacancies()),
                BlocBuilder<HospitalSingleBloc, HospitalSingleState>(
                  builder: (context, state) {
                    return HospitalContacts(
                      email: state.hospital.email,
                      facebook: state.hospital.facebook,
                      instagram: state.hospital.instagram,
                      phone: state.hospital.phone,
                      telegram: state.hospital.telegram,
                      website: state.hospital.website,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        backgroundColor: textFieldColor,
      ),
    );
  }
}
