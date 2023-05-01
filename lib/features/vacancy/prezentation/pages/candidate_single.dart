import 'package:anatomica/core/data/singletons/service_locator.dart';
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
import 'package:anatomica/features/vacancy/prezentation/widgets/about_candidate.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_contact_info.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_single_header.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/education_item_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/licence_item_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/related_candidate_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_title_text.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SingleCandidateScreen extends StatefulWidget {
  final int id;

  const SingleCandidateScreen({required this.id, Key? key}) : super(key: key);

  @override
  State<SingleCandidateScreen> createState() => _SingleCandidateScreenState();
}

class _SingleCandidateScreenState extends State<SingleCandidateScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  late HeaderManagerBloc _headerManagerBloc;
  late CandidateSingleBloc _candidateSingleBloc;
  final tabs = [
    LocaleKeys.about_candidate.tr(),
    LocaleKeys.edu.tr(),
    LocaleKeys.license_certificate.tr(),
    LocaleKeys.contact_detail.tr(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
    _headerManagerBloc = HeaderManagerBloc();
    _scrollController.addListener(_scrollListener);
    _candidateSingleBloc = CandidateSingleBloc(
        relatedCandidateListUseCase: RelatedCandidateListUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
        candidateWorkUseCase: CandidateWorkUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
        candidateEducationFilesUseCase:
            CandidateEducationFilesUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
        candidateEducationUseCase: CandidateEducationUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
        candidateSingleUseCase: CandidateSingleUseCase(repository: serviceLocator<VacancyRepositoryImpl>()));
    _candidateSingleBloc.add(GetRelatedCandidateListEvent(id: widget.id));
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _candidateSingleBloc.close();
    super.dispose();
  }

  _scrollListener() {
    _headerManagerBloc.add(ChangeVacancyScrollPosition(headerPosition: _scrollController.offset));
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
                  CandidateSingleHeader(
                    headerManagerBloc: _headerManagerBloc,
                    candidate: state.candidate,
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
                    AboutCandidate(
                      mediaQuery: mediaQuery,
                      candidateId: widget.id,
                      bio: state.candidate.bio,
                      showBio: state.candidate.showInProfileBio,
                      isRelatedEmpty: state.candidateList.isEmpty,
                    ),
                    ListView(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + mediaQuery.padding.bottom),
                      children: [
                        EducationItemList(candidateId: widget.id),
                        if (state.candidateList.isNotEmpty) ...[
                          Container(color: Colors.orange, height: 24),
                          VacancyTitleText(title: LocaleKeys.candidates.tr(), fontSize: 18),
                          const SizedBox(height: 16),
                          RelatedCandidateList(id: widget.id, margin: EdgeInsets.zero)
                        ],
                      ],
                    ),
                    ListView(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + mediaQuery.padding.bottom),
                      children: [
                        LicenceItemList(candidateId: state.candidate.id),
                        if (state.candidateList.isNotEmpty) ...[
                          const SizedBox(height: 24),
                          VacancyTitleText(title: LocaleKeys.candidates.tr(), fontSize: 18),
                          const SizedBox(height: 16),
                          RelatedCandidateList(id: widget.id, margin: EdgeInsets.zero)
                        ]
                      ],
                    ),
                    SingleChildScrollView(child: CandidateContactInfo(candidate: state.candidate)),
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
