import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/register_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/doctor_single/data/repositories/doctor_single_repository_impl.dart';
import 'package:anatomica/features/doctor_single/domain/usecases/doctor_comment.dart';
import 'package:anatomica/features/doctor_single/domain/usecases/doctor_comment_delete.dart';
import 'package:anatomica/features/doctor_single/domain/usecases/get_doctor_comments_usecase.dart';
import 'package:anatomica/features/hospital_single/data/repository/hospital_repository.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/delete_comment.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_comforts.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_comments.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_hospital_specialists_usecase.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_services.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_single_hospital.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_vacancies.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/post_comment_usecase.dart';
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
import 'package:anatomica/features/hospital_single/presentation/widgets/hospital_single_app_bar.dart';
import 'package:anatomica/features/map/presentation/blocs/header_manager_bloc/header_manager_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/comment_about_hospital.dart';
import 'package:anatomica/features/map/presentation/widgets/comment_bottom_sheet.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/map/presentation/widgets/tab_bar_header_delegate.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    LocaleKeys.about_clinic,
    LocaleKeys.videos,
    LocaleKeys.service,
    LocaleKeys.specialists,
    LocaleKeys.facility,
    LocaleKeys.articles,
    LocaleKeys.reviews,
    LocaleKeys.vacancy,
    LocaleKeys.contact,
  ];

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
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
    servicesBloc = ServicesBloc(GetServicesUseCase(
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
              HospitalSingleAppBar(
                  headerManagerBloc: _headerManagerBloc,
                  pageController: _pageController),
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
            body: BlocBuilder<HospitalSingleBloc, HospitalSingleState>(
              builder: (context, state) {
                return TabBarView(
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
                      value: commentsBloc,
                      child:  HospitalVideo(
                        videoDescription: state.hospital.videoDescription,
                      ),
                    ),
                    BlocProvider.value(
                        value: servicesBloc, child: const HospitalServices()),
                    BlocProvider.value(
                        value: hospitalSpecialistBloc,
                        child: const HospitalSpecialists()),
                    BlocProvider.value(
                        value: facilitiesBloc,
                        child: const HospitalConditions()),
                    BlocProvider.value(
                        value: articlesBloc, child: const HospitalArticles()),
                    BlocProvider.value(
                      value: commentsBloc,
                      child: HospitalComments(
                        commentCount: state.hospital.commentCount,
                        commentsBloc: commentsBloc,
                        overallRating: state.hospital.rating,
                      ),
                    ),
                    BlocProvider.value(
                        value: vacanciesBloc, child: const HospitalVacancies()),
                    BlocBuilder<HospitalSingleBloc, HospitalSingleState>(
                      builder: (context, state) {
                        return HospitalContacts(
                          email: state.hospital.email,
                          facebook: state.hospital.facebook,
                          instagram: state.hospital.instagram,
                          phone: state.hospital.phoneNumber,
                          telegram: state.hospital.telegram,
                          website: state.hospital.website,
                          phoneNumbers: state.hospital.phoneNumbers
                              .map((e) => e.phoneNumber)
                              .toList(),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        backgroundColor: textFieldColor,
      ),
    );
  }
}

class HospitalVideo extends StatelessWidget {
  final String videoDescription;
  const HospitalVideo({
    required this.videoDescription,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                margin: const EdgeInsets.symmetric(vertical: 20),
                color: white,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        WImage(
                          width: double.maxFinite,
                          imageUrl: 'https://picsum.photos/300/200',
                          height: 140,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: textColor.withOpacity(0.47),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Container(
                                height: 36,
                                width: 36,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: white.withOpacity(0.4)),
                                child: SvgPicture.asset(AppIcons.playIcon)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      videoDescription,
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
              ),
              if (state.comments.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 32, 0, 12),
                  child: Text(
                    LocaleKeys.reviews.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 20),
                  ),
                ),
                Column(
                  children: List.generate(
                    state.comments.take(3).length,
                    (index) => CommentAboutHospital(
                      entity: state.comments[index],
                    ),
                  ),
                ),
                WButton(
                  onTap: () {},
                  margin: const EdgeInsets.all(16).copyWith(
                      bottom: MediaQuery.of(context).padding.bottom + 16),
                  color: commentButton,
                  text: LocaleKeys.all_reviews.tr(),
                  textColor: textSecondary,
                )
              ] else ...{
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    return EmptyWidget(
                      onButtonTap: () {
                        if (state.status ==
                            AuthenticationStatus.authenticated) {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) => CommentBottomSheet(
                              parentContext: context,
                              commentsBloc: context.read<CommentsBloc>(),
                            ),
                          );
                        } else {
                          showRegisterBottomSheet(context);
                        }
                      },
                    );
                  },
                )
              },
            ],
          ),
        );
      },
    );
  }
}
