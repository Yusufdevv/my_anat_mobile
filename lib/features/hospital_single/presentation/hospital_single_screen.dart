import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/doctor_single/data/repositories/doctor_single_repository_impl.dart';
import 'package:anatomica/features/doctor_single/domain/usecases/doctor_comment.dart';
import 'package:anatomica/features/doctor_single/domain/usecases/doctor_comment_delete.dart';
import 'package:anatomica/features/doctor_single/domain/usecases/get_doctor_comments_usecase.dart';
import 'package:anatomica/features/hospital_single/data/repository/hospital_repository.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_single_widget_type.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/delete_comment.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_comforts.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_comments.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_hospital_specialists_usecase.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_services.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_single_hospital.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_single_service_usecase.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_vacancies.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/post_comment_usecase.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/comments/comments_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/facilities/facilities_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/h_articles/h_articles_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/hospital_single/hospital_single_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/hospital_specialist/hospital_specialist_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/services/services_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/vacancies/hospital_vacancies_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/about_hospital.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_article_horizontal_list.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_comments_horizontal_list.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_conditions_horizontal_list.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_contacts.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_sevices.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_specialists.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_vacancies_hosizontal_list.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_video.dart';
import 'package:anatomica/features/hospital_single/presentation/widgets/hospital_single_app_bar.dart';
import 'package:anatomica/features/map/presentation/blocs/header_manager_bloc/header_manager_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/tab_bar_header_delegate.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HospitalSingleScreen extends StatefulWidget {
  final String slug;
  final int id;

  const HospitalSingleScreen({required this.id, required this.slug, Key? key})
      : super(key: key);

  @override
  State<HospitalSingleScreen> createState() => _HospitalSingleScreenState();
}

class _HospitalSingleScreenState extends State<HospitalSingleScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late HeaderManagerBloc _headerManagerBloc;
  late PageController _pageController;
  late HospitalSingleBloc hospitalSingleBloc;
  late CommentsBloc commentsBloc;
  late ServicesBloc servicesBloc;
  late HospitalSpecialistBloc hospitalSpecialistBloc;
  late FacilitiesBloc facilitiesBloc;
  late HArticlesBloc articlesBloc;
  late HospitalVacanciesBloc vacanciesBloc;
  late AutoScrollController controller;
  bool hasServices = true;
  bool hasSpecialists = true;
  bool hasFacility = true;
  bool hasArticle = true;
  bool hasVideo = true;
  int currentImage = 0;
  final tabs = <HospitalSingleWidgetType>[
    HospitalSingleWidgetType(
        title: LocaleKeys.about_clinic,
        keyTitle: 'about_clinic',
        key: GlobalKey()),
    HospitalSingleWidgetType(
        title: LocaleKeys.videos, keyTitle: 'videos', key: GlobalKey()),
    HospitalSingleWidgetType(
        title: LocaleKeys.service, keyTitle: 'service', key: GlobalKey()),
    HospitalSingleWidgetType(
      title: LocaleKeys.specialists,
      keyTitle: 'specialists',
      key: GlobalKey(),
    ),
    HospitalSingleWidgetType(
        title: LocaleKeys.facility, keyTitle: 'facility', key: GlobalKey()),
    HospitalSingleWidgetType(
        title: LocaleKeys.articles, keyTitle: 'articles', key: GlobalKey()),
    HospitalSingleWidgetType(
        title: LocaleKeys.reviews, keyTitle: 'reviews', key: GlobalKey()),
    HospitalSingleWidgetType(
        title: LocaleKeys.vacancy, keyTitle: 'vacancy', key: GlobalKey()),
    HospitalSingleWidgetType(
        title: LocaleKeys.contact, keyTitle: 'contact', key: GlobalKey()),
  ];

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController();
    vacanciesBloc = HospitalVacanciesBloc(GetHospitalVacancies(
        repository: serviceLocator<HospitalSingleRepositoryImpl>()))
      ..add(HospitalVacanciesEvent.getVacancies(organizationId: widget.id));
    articlesBloc = HArticlesBloc(GetHArticlesUseCase(
        repository: serviceLocator<HospitalSingleRepositoryImpl>()))
      ..add(HArticlesEvent.getArticles(organizationId: widget.id));
    facilitiesBloc = FacilitiesBloc(GetComfortsUseCase(
        repository: serviceLocator<HospitalSingleRepositoryImpl>()))
      ..add(FacilitiesEvent.getFacilities(organizationId: widget.id));
    hospitalSpecialistBloc = HospitalSpecialistBloc(
        GetHospitalSpecialistsUseCase(
            repository: serviceLocator<HospitalSingleRepositoryImpl>()))
      ..add(HospitalSpecialistEvent.getSpecialists(organizationId: widget.id));
    servicesBloc = ServicesBloc(
        GetServicesUseCase(
            repository: serviceLocator<HospitalSingleRepositoryImpl>()),
        getSingleServiceUseCase: GetSingleServiceUseCase(
            repository: serviceLocator<HospitalSingleRepositoryImpl>()))
      ..add(ServicesEvent.getServices(organizationId: widget.id));

    commentsBloc = CommentsBloc(
        deletePostCommentUseCase: DeletePostCommentUseCase(
            repository: serviceLocator<HospitalSingleRepositoryImpl>()),
        doctorCommentDeleteUseCase: DoctorCommentDeleteUseCase(
            repository: serviceLocator<DoctorSingleRepositoryImpl>()),
        doctorCommentUseCase: DoctorCommentUseCase(
            repository: serviceLocator<DoctorSingleRepositoryImpl>()),
        GetCommentsUseCase(
            repository: serviceLocator<HospitalSingleRepositoryImpl>()),
        postCommentUseCase: PostCommentUseCase(
            repository: serviceLocator<HospitalSingleRepositoryImpl>()),
        getDoctorCommentsUseCase: GetDoctorCommentsUseCase(
            repository: serviceLocator<DoctorSingleRepositoryImpl>()))
      ..add(CommentsEvent.getComments(organizationId: widget.id));
    hospitalSingleBloc = HospitalSingleBloc(GetSingleHospitalUseCase(
        repository: serviceLocator<HospitalSingleRepositoryImpl>()))
      ..add(HospitalSingleEvent.getHospital(widget.slug));
    _tabController = TabController(length: tabs.length, vsync: this);
    _headerManagerBloc = HeaderManagerBloc();
    _pageController = PageController();
    controller.addListener(_scrollListener);
  }

  _scrollListener() {
    _headerManagerBloc
        .add(ChangeHeaderScrollPosition(headerPosition: controller.offset));
  }

  @override
  Widget build(BuildContext context) {
    print('hospital slug => ${widget.slug}');
    return WKeyboardDismisser(
      child: DefaultTabController(
        length: tabs.length,
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(systemNavigationBarColor: white),
          child: Scaffold(
            body: MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: hospitalSingleBloc,
                ),
                BlocProvider.value(
                  value: commentsBloc,
                ),
                BlocProvider.value(
                  value: servicesBloc,
                ),
                BlocProvider.value(
                  value: hospitalSpecialistBloc,
                ),
                BlocProvider.value(
                  value: facilitiesBloc,
                ),
                BlocProvider.value(
                  value: articlesBloc,
                ),
                BlocProvider.value(
                  value: vacanciesBloc,
                ),
              ],
              child: MultiBlocListener(
                listeners: [
                  BlocListener<ServicesBloc, ServicesState>(
                    listener: (context, state) {
                      if (state.status.isSubmissionSuccess &&
                          state.services.isEmpty) {
                        setState(() {
                          tabs.removeWhere(
                              (element) => element.keyTitle == 'service');
                          hasServices = false;
                        });
                      }
                    },
                  ),
                  BlocListener<HArticlesBloc, HArticlesState>(
                    listener: (context, state) {
                      if (state.status.isSubmissionSuccess &&
                          state.articles.isEmpty) {
                        setState(() {
                          tabs.removeWhere(
                              (element) => element.keyTitle == 'articles');
                          hasArticle = false;
                        });
                      }
                    },
                  ),
                  BlocListener<FacilitiesBloc, FacilitiesState>(
                    listener: (context, state) {
                      if (state.status.isSubmissionSuccess &&
                          state.comforts.isEmpty) {
                        setState(() {
                          tabs.removeWhere(
                              (element) => element.keyTitle == 'facility');
                          hasFacility = false;
                        });
                      }
                    },
                  ),
                  BlocListener<HospitalSpecialistBloc, HospitalSpecialistState>(
                    listener: (context, state) {
                      if (state.status.isSubmissionSuccess &&
                          state.specialists.isEmpty) {
                        setState(() {
                          tabs.removeWhere(
                              (element) => element.keyTitle == 'specialists');
                          hasSpecialists = false;
                        });
                      }
                    },
                  ),
                ],
                child: BlocConsumer<HospitalSingleBloc, HospitalSingleState>(
                  listener: (context, state) {
                    if (state.status.isSubmissionSuccess &&
                        state.hospital.videoLink.isEmpty &&
                        state.hospital.videos.isEmpty) {
                      setState(() {
                        tabs.removeWhere(
                            (element) => element.keyTitle == 'videos');
                        hasVideo = false;
                      });
                    }
                  },
                  builder: (context, state) {
                    print('isPaid => ${state.hospital.paid}');
                    if (state.status.isSubmissionInProgress) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    } else if (state.status.isSubmissionSuccess) {
                      return InViewNotifierCustomScrollView(
                        controller: controller,
                        //throttleDuration: const Duration(milliseconds: 300),
                        slivers: [
                          HospitalSingleAppBar(
                              headerManagerBloc: _headerManagerBloc,
                              pageController: _pageController),
                          if (!state.hospital.paid) ...{
                            SliverToBoxAdapter(
                              child: Column(
                                children: [
                                  AboutHospital(
                                    hospital: state.hospital,
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            )
                          } else ...{
                            SliverPersistentHeader(
                              pinned: true,
                              delegate: TabBarHeaderDelegate(
                                controller: controller,
                                onTabTap: (index) {
                                  controller.scrollToIndex(
                                    index,
                                    preferPosition: AutoScrollPosition.begin,
                                    duration: const Duration(milliseconds: 200),
                                  );
                                },
                                tabController: DefaultTabController.of(context),
                                tabs: tabs.map((e) => e.title).toList(),
                              ),
                            ),
                            SliverList(
                              delegate: SliverChildListDelegate.fixed(
                                [
                                  const SizedBox(height: 20),
                                  BlocProvider.value(
                                    value: _headerManagerBloc,
                                    child: BlocBuilder<HeaderManagerBloc,
                                        HeaderManagerState>(
                                      builder: (context, headerManagerState) {
                                        return InViewNotifierWidget(
                                          id: '1',
                                          builder: (context, isInView, child) {
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (timeStamp) {
                                              if (isInView ||
                                                  !headerManagerState
                                                      .isHeaderScrolled) {
                                                DefaultTabController.of(context)
                                                    .animateTo(0);
                                              }
                                            });
                                            return child ?? const SizedBox();
                                          },
                                          child: AutoScrollTag(
                                            controller: controller,
                                            key: const ValueKey(0),
                                            index: 0,
                                            child: AboutHospital(
                                              hospital: state.hospital,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  if (hasVideo) ...{
                                    InViewNotifierWidget(
                                      id: '2',
                                      builder: (context, isInView, child) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((timeStamp) {
                                          if (isInView) {
                                            DefaultTabController.of(context)
                                                .animateTo(tabs.indexWhere(
                                                    (element) =>
                                                        element.keyTitle ==
                                                        'videos'));
                                          }
                                        });
                                        return child ?? const SizedBox();
                                      },
                                      child: AutoScrollTag(
                                        controller: controller,
                                        key: const ValueKey(1),
                                        index: tabs.indexWhere((element) =>
                                            element.keyTitle == 'videos'),
                                        child: HospitalVideo(
                                          videoUrl: state.hospital.videoLink,
                                          videos: state.hospital.videos,
                                          videoDescription:
                                              state.hospital.videoDescription,
                                          tabController: _tabController,
                                        ),
                                      ),
                                    ),
                                  },
                                  if (hasServices) ...{
                                    InViewNotifierWidget(
                                        id: '3',
                                        builder: (context, isInView, child) {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback(
                                                  (timeStamp) {
                                            if (isInView) {
                                              DefaultTabController.of(context)
                                                  .animateTo(tabs.indexWhere(
                                                      (element) =>
                                                          element.keyTitle ==
                                                          'service'));
                                            }
                                          });

                                          return child ?? const SizedBox();
                                        },
                                        child: AutoScrollTag(
                                            controller: controller,
                                            key: const ValueKey(2),
                                            index: tabs.indexWhere((element) =>
                                                element.keyTitle == 'service'),
                                            child: HospitalServices(
                                                servicesBloc: servicesBloc))),
                                  },
                                  if (hasSpecialists) ...{
                                    InViewNotifierWidget(
                                        id: '4',
                                        builder: (context, isInView, child) {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback(
                                            (timeStamp) {
                                              if (isInView) {
                                                DefaultTabController.of(context)
                                                    .animateTo(tabs.indexWhere(
                                                        (element) =>
                                                            element.keyTitle ==
                                                            'specialists'));
                                              }
                                            },
                                          );
                                          return child ?? const SizedBox();
                                        },
                                        child: AutoScrollTag(
                                            controller: controller,
                                            key: const ValueKey(3),
                                            index: tabs.indexWhere((element) =>
                                                element.keyTitle ==
                                                'specialists'),
                                            child:
                                                const HospitalSpecialists())),
                                  },
                                  if (hasFacility) ...{
                                    InViewNotifierWidget(
                                        id: '5',
                                        builder: (context, isInView, child) {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback(
                                                  (timeStamp) {
                                            if (isInView) {
                                              DefaultTabController.of(context)
                                                  .animateTo(tabs.indexWhere(
                                                      (element) =>
                                                          element.keyTitle ==
                                                          'facility'));
                                            }
                                          });
                                          return child ?? const SizedBox();
                                        },
                                        child: AutoScrollTag(
                                            controller: controller,
                                            key: const ValueKey(4),
                                            index: tabs.indexWhere((element) =>
                                                element.keyTitle == 'facility'),
                                            child:
                                                const HospitalConditionsHorizontalList()))
                                  },
                                  if (hasArticle) ...{
                                    InViewNotifierWidget(
                                        id: '6',
                                        builder: (context, isInView, child) {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback(
                                                  (timeStamp) {
                                            if (isInView) {
                                              DefaultTabController.of(context)
                                                  .animateTo(tabs.indexWhere(
                                                      (element) =>
                                                          element.keyTitle ==
                                                          'articles'));
                                            }
                                          });

                                          return child ?? const SizedBox();
                                        },
                                        child: AutoScrollTag(
                                            controller: controller,
                                            key: const ValueKey(5),
                                            index: tabs.indexWhere((element) =>
                                                element.keyTitle == 'articles'),
                                            child:
                                                HospitalArticlesHorizontalList(
                                                    hospitalId: widget.id)))
                                  },
                                  InViewNotifierWidget(
                                      id: '7',
                                      builder: (context, isInView, child) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((timeStamp) {
                                          if (isInView) {
                                            DefaultTabController.of(context)
                                                .animateTo(tabs.indexWhere(
                                                    (element) =>
                                                        element.keyTitle ==
                                                        'reviews'));
                                          }
                                        });

                                        return child ?? const SizedBox();
                                      },
                                      child: AutoScrollTag(
                                          controller: controller,
                                          key: const ValueKey(6),
                                          index: tabs.indexWhere((element) =>
                                              element.keyTitle == 'reviews'),
                                          child: HospitalCommentsHorizontalList(
                                              hospital: state.hospital))),
                                  InViewNotifierWidget(
                                      id: '8',
                                      builder: (context, isInView, child) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((timeStamp) {
                                          if (isInView) {
                                            DefaultTabController.of(context)
                                                .animateTo(tabs.indexWhere(
                                                    (element) =>
                                                        element.keyTitle ==
                                                        'vacancy'));
                                          }
                                        });
                                        return child ?? const SizedBox();
                                      },
                                      child: AutoScrollTag(
                                          controller: controller,
                                          key: const ValueKey(7),
                                          index: tabs.indexWhere((element) =>
                                              element.keyTitle == 'vacancy'),
                                          child:
                                              const HospitalVacanciesHorizontalList())),
                                  InViewNotifierWidget(
                                    id: '9',
                                    builder: (context, isInView, child) {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((timeStamp) {
                                        if (isInView) {
                                          DefaultTabController.of(context)
                                              .animateTo(tabs.indexWhere(
                                                  (element) =>
                                                      element.keyTitle ==
                                                      'contact'));
                                        }
                                      });
                                      return child ?? const SizedBox();
                                    },
                                    child: AutoScrollTag(
                                      controller: controller,
                                      key: const ValueKey(8),
                                      index: tabs.indexWhere((element) =>
                                          element.keyTitle == 'contact'),
                                      child: HospitalContacts(
                                        email: state.hospital.email,
                                        facebook: state.hospital.facebook,
                                        instagram: state.hospital.instagram,
                                        phone: state.hospital.phoneNumber,
                                        telegram: state.hospital.telegram,
                                        website: state.hospital.website,
                                        phoneNumbers: state
                                            .hospital.phoneNumbers
                                            .map((e) => e.phoneNumber)
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          }
                        ],
                        isInViewPortCondition: (double deltaTop,
                                double deltaBottom, double viewPortDimension) =>
                            deltaTop < (0.01 * viewPortDimension) &&
                            deltaBottom > (0.01 * viewPortDimension),
                      );
                    } else if (state.status.isSubmissionFailure) {
                      return const Center(
                        child: Text('Error'),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),
            backgroundColor: textFieldColor,
          ),
        ),
      ),
    );
  }
}
