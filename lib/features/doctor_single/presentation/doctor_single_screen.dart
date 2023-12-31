import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/doctor_single/data/repositories/doctor_single_repository_impl.dart';
import 'package:anatomica/features/doctor_single/domain/usecases/get_doctor_articles_usecase.dart';
import 'package:anatomica/features/doctor_single/domain/usecases/get_doctor_interviews_usecase.dart';
import 'package:anatomica/features/doctor_single/domain/usecases/get_doctor_single_usecase.dart';
import 'package:anatomica/features/doctor_single/presentation/blocs/doctor_articles_bloc/doctor_articles_bloc.dart';
import 'package:anatomica/features/doctor_single/presentation/blocs/doctor_interviews/doctor_interviews_bloc.dart';
import 'package:anatomica/features/doctor_single/presentation/blocs/doctor_single_bloc/doctor_single_bloc.dart';
import 'package:anatomica/features/doctor_single/presentation/parts/about_doctor.dart';
import 'package:anatomica/features/doctor_single/presentation/parts/doctor_articles.dart';
import 'package:anatomica/features/doctor_single/presentation/parts/doctor_comments.dart';
import 'package:anatomica/features/doctor_single/presentation/parts/doctor_contacts.dart';
import 'package:anatomica/features/doctor_single/presentation/parts/doctor_interviews.dart';
import 'package:anatomica/features/doctor_single/presentation/widgets/doctor_single_appbar.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/comments/comments_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/header_manager_bloc/header_manager_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/tab_bar_header_delegate.dart';
import 'package:anatomica/features/vacancy/data/repositories/vacancy_repository_impl.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_certificate.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_education.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_education_files_usecase.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_single.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_work.dart';
import 'package:anatomica/features/vacancy/domain/usecases/related_candidate.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/candidate_single/candidate_single_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/licence_item_list.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class DoctorSingleScreen extends StatefulWidget {
  final int id;

  const DoctorSingleScreen({required this.id, Key? key}) : super(key: key);

  @override
  State<DoctorSingleScreen> createState() => _DoctorSingleScreenState();
}

class _DoctorSingleScreenState extends State<DoctorSingleScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  late HeaderManagerBloc _headerManagerBloc;
  late CandidateSingleBloc _candidateSingleBloc;
  late PageController _pageController;
  int currentImage = 0;
  final tabs = [
    LocaleKeys.about_doctor.tr(),
    LocaleKeys.articles.tr(),
    LocaleKeys.license_certificate.tr(),
    LocaleKeys.interview.tr(),
    LocaleKeys.reviews.tr(),
    LocaleKeys.contact.tr(),
  ];

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _candidateSingleBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _tabController = TabController(length: 6, vsync: this);
    _scrollController = ScrollController();
    _headerManagerBloc = HeaderManagerBloc();
    _scrollController.addListener(_scrollListener);
    _candidateSingleBloc = CandidateSingleBloc(
        relatedCandidateListUseCase: RelatedCandidateListUseCase(
            repository: serviceLocator<VacancyRepositoryImpl>()),
        candidateWorkUseCase: CandidateWorkUseCase(
            repository: serviceLocator<VacancyRepositoryImpl>()),
        candidateEducationFilesUseCase: CandidateEducationFilesUseCase(
            repository: serviceLocator<VacancyRepositoryImpl>()),
        candidateEducationUseCase: CandidateEducationUseCase(
            repository: serviceLocator<VacancyRepositoryImpl>()),
        candidateSingleUseCase: CandidateSingleUseCase(
            repository: serviceLocator<VacancyRepositoryImpl>()));
    _candidateSingleBloc.add(GetRelatedCandidateListEvent(id: widget.id));
  }

  _scrollListener() {
    _headerManagerBloc.add(
        ChangeHeaderScrollPosition(headerPosition: _scrollController.offset));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DoctorSingleBloc(
            getDoctorSingleUseCase: GetDoctorSingleUseCase(
              repository: serviceLocator<DoctorSingleRepositoryImpl>(),
            ),
          )..add(GetDoctorSingle(id: widget.id)),
        ),
        BlocProvider(create: (context) => _candidateSingleBloc),
        BlocProvider(
          create: (context) => DoctorArticlesBloc(
            getDoctorArticlesUseCase: GetDoctorArticlesUseCase(
              repository: serviceLocator<DoctorSingleRepositoryImpl>(),
            ),
          )..add(GetDoctorArticles(doctorId: widget.id)),
        ),
        BlocProvider(
            create: (context) => DoctorInterviewsBloc(
                getDoctorInterviewsUseCase: GetDoctorInterviewsUseCase(
                    repository: serviceLocator<DoctorSingleRepositoryImpl>()))
              ..add(GetDoctorInterviews(doctorId: widget.id))),
        BlocProvider(
            create: (context) => CommentsBloc()
              ..add(CommentsEvent.getDoctorComments(doctorId: widget.id))),
      ],
      child: WKeyboardDismisser(
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(systemNavigationBarColor: white),
          child: Scaffold(
            body: CustomScreen(
              child: BlocBuilder<DoctorSingleBloc, DoctorSingleState>(
                builder: (context, state) {
                  if (state.getDoctorSingleStatus.isSubmissionInProgress) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  } else if (state.getDoctorSingleStatus.isSubmissionSuccess) {
                    return NestedScrollView(
                      controller: _scrollController,
                      floatHeaderSlivers: false,
                      headerSliverBuilder: (context, isHeaderScrolled) => [
                        DoctorSingleAppBar(
                          headerManagerBloc: _headerManagerBloc,
                          doctor: state.doctorSingle,
                          pageController: _pageController,
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
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: AboutDoctor(
                              controller: _tabController,
                              showBio: state.doctorSingle.showInProfileBio,
                              description: state.doctorSingle.bio,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: DoctorArticles(doctorId: widget.id),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: ListView(
                                padding: const EdgeInsets.all(16),
                                children: [
                                  LicenceItemList(candidateId: widget.id)
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: DoctorInterviews(doctorId: widget.id),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: DoctorComments(
                              rating: state.doctorSingle.rating,
                              doctor: widget.id,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: DoctorContacts(
                              doctorSingle: state.doctorSingle,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state.getDoctorSingleStatus.isSubmissionFailure) {
                    return const Center(child: Text('error'));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            backgroundColor: textFieldColor,
          ),
        ),
      ),
    );
  }
}
