import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/doctor_single/data/repositories/doctor_single_repository_impl.dart';
import 'package:anatomica/features/doctor_single/domain/usecases/get_doctor_articles_usecase.dart';
import 'package:anatomica/features/doctor_single/domain/usecases/get_doctor_comments_usecase.dart';
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
import 'package:anatomica/features/hospital_single/data/repository/hospital_repository.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_comments.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/post_comment_usecase.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/comments/comments_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/header_manager_bloc/header_manager_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/tab_bar_header_delegate.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class DoctorSingleScreen extends StatefulWidget {
  final int id;
  const DoctorSingleScreen({required this.id, Key? key}) : super(key: key);

  @override
  State<DoctorSingleScreen> createState() => _DoctorSingleScreenState();
}

class _DoctorSingleScreenState extends State<DoctorSingleScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  late HeaderManagerBloc _headerManagerBloc;
  int currentImage = 0;
  final tabs = [
    LocaleKeys.about_doctor.tr(),
    LocaleKeys.articles.tr(),
    LocaleKeys.interview.tr(),
    LocaleKeys.reviews.tr(),
    LocaleKeys.contact.tr(),
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
    _tabController = TabController(length: 5, vsync: this);
    _scrollController = ScrollController();
    _headerManagerBloc = HeaderManagerBloc();
    _scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    _headerManagerBloc.add(ChangeHeaderScrollPosition(headerPosition: _scrollController.offset));
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
        BlocProvider(
          create: (context) => DoctorArticlesBloc(
            getDoctorArticlesUseCase: GetDoctorArticlesUseCase(
              repository: serviceLocator<DoctorSingleRepositoryImpl>(),
            ),
          )..add(GetDoctorArticles(doctorId: widget.id)),
        ),
        BlocProvider(
            create: (context) => DoctorInterviewsBloc(
                getDoctorInterviewsUseCase:
                    GetDoctorInterviewsUseCase(repository: serviceLocator<DoctorSingleRepositoryImpl>()))
              ..add(GetDoctorInterviews(doctorId: widget.id))),
        BlocProvider(
            create: (context) => CommentsBloc(
                GetCommentsUseCase(repository: serviceLocator<HospitalSingleRepositoryImpl>()),
                postCommentUseCase: PostCommentUseCase(repository: serviceLocator<HospitalSingleRepositoryImpl>()),
                getDoctorCommentsUseCase:
                    GetDoctorCommentsUseCase(repository: serviceLocator<DoctorSingleRepositoryImpl>()))
              ..add(CommentsEvent.getDoctorComments(doctorId: widget.id))),
      ],
      child: WKeyboardDismisser(
        child: Scaffold(
          body: BlocBuilder<DoctorSingleBloc, DoctorSingleState>(
            builder: (context, state) {
              if (state.getDoctorSingleStatus.isSubmissionInProgress) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.getDoctorSingleStatus.isSubmissionSuccess) {
                return NestedScrollView(
                  floatHeaderSlivers: false,
                  controller: _scrollController,
                  headerSliverBuilder: (context, isHeaderScrolled) => [
                    DoctorSingleAppBar(headerManagerBloc: _headerManagerBloc, doctor: state.doctorSingle),
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
                      AboutDoctor(),
                      DoctorArticles(doctorId: widget.id),
                      DoctorInterviews(doctorId: widget.id),
                      DoctorComments(rating: state.doctorSingle.rating),
                      DoctorContacts(
                        doctorSingle: state.doctorSingle,
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
          backgroundColor: textFieldColor,
        ),
      ),
    );
  }
}
