import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/common/presentation/widgets/rating_container.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/doctor_single/presentation/parts/about_doctor.dart';
import 'package:anatomica/features/doctor_single/presentation/parts/doctor_articles.dart';
import 'package:anatomica/features/doctor_single/presentation/parts/doctor_comments.dart';
import 'package:anatomica/features/doctor_single/presentation/parts/doctor_contacts.dart';
import 'package:anatomica/features/doctor_single/presentation/parts/doctor_interviews.dart';
import 'package:anatomica/features/map/presentation/blocs/header_manager_bloc/header_manager_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:anatomica/features/map/presentation/widgets/tab_bar_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class DoctorSingleScreen extends StatefulWidget {
  const DoctorSingleScreen({Key? key}) : super(key: key);

  @override
  State<DoctorSingleScreen> createState() => _DoctorSingleScreenState();
}

class _DoctorSingleScreenState extends State<DoctorSingleScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  late HeaderManagerBloc _headerManagerBloc;
  late PageController _pageController;
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
    _pageController = PageController();
    _scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    _headerManagerBloc.add(ChangeHeaderScrollPosition(headerPosition: _scrollController.offset));
  }

  @override
  Widget build(BuildContext context) {
    return WKeyboardDismisser(
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: false,
          controller: _scrollController,
          headerSliverBuilder: (context, isHeaderScrolled) => [
            BlocProvider.value(
              value: _headerManagerBloc,
              child: BlocBuilder<HeaderManagerBloc, HeaderManagerState>(
                builder: (context, state) {
                  return SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    sliver: SliverSafeArea(
                      top: false,
                      bottom: false,
                      sliver: SliverAppBar(
                        title: state.isHeaderScrolled ? const HospitalSingleAppBarBody() : Container(),
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
                                bottom: 178,
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                            child: Image.asset(
                                              AppImages.doctor,
                                              fit: BoxFit.cover,
                                              height: 277,
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
                                            'Иргашев Дильмурад\nСаатович',
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
                                              'Репродуктолог',
                                              style: Theme.of(context).textTheme.headline3!.copyWith(color: white),
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
                                      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
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
                                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(AppIcons.location),
                                                const SizedBox(width: 6),
                                                Text(
                                                  'г. Ташкент, улица Содика Азимова, 74',
                                                  style:
                                                  Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                SvgPicture.asset(AppIcons.phone),
                                                const SizedBox(width: 6),
                                                Text(
                                                  '+998 71 200-70-07',
                                                  style:
                                                  Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
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
                                                  style:
                                                  Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                            Row(
                                              children: [
                                                Text(
                                                  '4,0',
                                                  style:
                                                  Theme.of(context).textTheme.headline3!.copyWith(color: darkGreen),
                                                ),
                                                const SizedBox(width: 8),
                                                const RatingStars(
                                                  rate: 4,
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: WButton(
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
                                                          LocaleKeys.call.tr(),
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .headline3!
                                                              .copyWith(color: white),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Expanded(
                                                  child: WButton(
                                                    color: white,
                                                    onTap: () {},
                                                    padding: EdgeInsets.zero,
                                                    border: Border.all(color: primary),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          AppIcons.mapRoute,
                                                          height: 20,
                                                          width: 20,
                                                        ),
                                                        const SizedBox(width: 8),
                                                        Text(
                                                          LocaleKeys.get.tr(),
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .headline3!
                                                              .copyWith(color: primary),
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
                                      const Divider(height: 0, thickness: 1, color: textFieldColor)
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
            children: const [
              AboutDoctor(),
              DoctorArticles(),
              DoctorInterviews(),
              DoctorComments(),
              DoctorContacts(),
            ],
          ),
        ),
        backgroundColor: textFieldColor,
      ),
    );
  }
}
