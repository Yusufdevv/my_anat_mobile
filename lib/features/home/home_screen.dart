import 'dart:ui';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/home/presentation/blocs/category_bloc/category_bloc.dart';
import 'package:anatomica/features/home/presentation/blocs/home_articles_bloc/home_articles_bloc.dart';
import 'package:anatomica/features/home/presentation/blocs/most_populars_bloc/most_populars_bloc.dart';
import 'package:anatomica/features/home/presentation/blocs/news_bloc/news_bloc.dart';
import 'package:anatomica/features/home/presentation/parts/news_part.dart';
import 'package:anatomica/features/home/presentation/widgets/category_item.dart';
import 'package:anatomica/features/home/presentation/widgets/category_shimmer.dart';
import 'package:anatomica/features/home/presentation/widgets/news_item.dart';
import 'package:anatomica/features/home/presentation/widgets/news_shimmer.dart';
import 'package:anatomica/features/home/presentation/widgets/titles_item.dart';
import 'package:anatomica/features/home/presentation/widgets/top_articles_item.dart';
import 'package:anatomica/features/home/presentation/widgets/top_doctor_item.dart';
import 'package:anatomica/features/home/presentation/widgets/top_hospital_item.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> with TickerProviderStateMixin {
  late TextEditingController searchController;
  late CategoryBloc _categoryBloc;
  late HomeArticlesBloc _homeArticlesBloc;
  late MostPopularsBloc _mostPopularsBloc;
  late NewsBloc _newsBloc;
  late PageController _pageController;
  late ScrollController _scrollController;
  bool isShrink = false;

  @override
  void initState() {
    searchController = TextEditingController();
    _categoryBloc = CategoryBloc()..add(const CategoryEvent.getCategories());
    _homeArticlesBloc = HomeArticlesBloc()
      ..add(const HomeArticlesEvent.getHomeArticles());
    _mostPopularsBloc = MostPopularsBloc()
      ..add(const MostPopularsEvent.getPopularOrgs())
      ..add(const MostPopularsEvent.getPopularDoctors());
    _newsBloc = NewsBloc()..add(const NewsEvent.getNews());
    _pageController = PageController();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset > 200 - kToolbarHeight && !isShrink) {
          setState(() {
            isShrink = true;
          });
        } else if (_scrollController.offset < 200 - kToolbarHeight &&
            isShrink) {
          setState(() {
            isShrink = false;
          });
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _categoryBloc),
          BlocProvider.value(value: _mostPopularsBloc),
          BlocProvider.value(value: _newsBloc),
          BlocProvider.value(value: _homeArticlesBloc),
        ],
        child: Scaffold(
          backgroundColor: errorImageBackground,
          body: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: errorImageBackground,
                shape: const RoundedRectangleBorder(),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AppIcons.anatomica,
                      width: 128,
                      height: 28,
                      color: isShrink ? black : white,
                    ),
                    WScaleAnimation(
                      child: SvgPicture.asset(
                        AppIcons.notificationWithRedDot,
                        color: isShrink ? black : white,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                expandedHeight: 324,
                elevation: 0,
                scrolledUnderElevation: 0,
                flexibleSpace: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: isShrink
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  secondCurve: Curves.fastLinearToSlowEaseIn,
                  firstCurve: Curves.fastLinearToSlowEaseIn,
                  secondChild: Container(
                    color: white,
                    height: MediaQuery.of(context).size.height,
                  ),
                  firstChild: Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              foregroundDecoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    textColor.withOpacity(0.9),
                                    textColor.withOpacity(0.2),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(16),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://openseauserdata.com/files/b261626a159edf64a8a92aa7306053b8.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        right: 16,
                        left: 16,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(
                              // height: 106,
                              decoration: BoxDecoration(
                                color: textColor.withOpacity(.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(16, 16, 16, 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Журнал',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(color: primary),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Журнал ANATOMICÁ выпустил весенний номер, AKFA Medline',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(color: white),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 12),
                                  SmoothPageIndicator(
                                    controller:
                                        _pageController, // PageController
                                    count: 5,
                                    effect: const WormEffect(
                                      activeDotColor: white,
                                      dotHeight: 10,
                                      dotWidth: 10,
                                    ), // your preferred effect
                                    onDotClicked: (index) {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: SearchField(
                    controller: searchController,
                    onChanged: (value) {},
                  ),
                ),
              ),
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 16),
                      child:
                          state.categoryStatus != FormzStatus.submissionSuccess
                              ? Wrap(
                                  runSpacing: 8,
                                  spacing: 8,
                                  children: [
                                    ...List.generate(
                                        6, (index) => const CategoryShimmer())
                                  ],
                                )
                              : Wrap(
                                  runSpacing: 8,
                                  spacing: 8,
                                  children: [
                                    ...List.generate(
                                      state.categories.length > 5
                                          ? 5
                                          : state.categories.length,
                                      (index) => CategoryItem(
                                        logo: state.categories[index].icon,
                                        title: state.categories[index].title,
                                        onTap: () {
                                          // Navigator.of(context, rootNavigator: true)
                                          //     .push(
                                          //   fade(
                                          //     page:
                                          //   ),
                                          // );
                                        },
                                      ),
                                    ),
                                    Offstage(
                                      offstage: state.categories.length < 6,
                                      child: CategoryItem(
                                        logo: AppIcons.moreVertical,
                                        // TODO locale
                                        title: "Другие",
                                        onTap: () {},
                                      ),
                                    ),
                                  ],
                                ),
                    ),
                  );
                },
              ),

              /// NEWS
              SliverToBoxAdapter(
                child: TitlesItem(
                  title: 'Новости',
                  showAllFunction: () {
                    Navigator.of(context, rootNavigator: true)
                        .push(fade(page: const NewsPart()));
                  },
                  showAllTitle: 'Все новости',
                ),
              ),
              BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  return SliverToBoxAdapter(
                    child: state.newsStatus != FormzStatus.submissionSuccess
                        ? ListView.separated(
                            itemCount: 10,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) =>
                                const NewsShimmer(),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                          )
                        : ListView.separated(
                            itemCount:
                                state.news.length > 5 ? 5 : state.news.length,
                            padding: const EdgeInsets.only(left: 16),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) => state.newsStatus !=
                                    FormzStatus.submissionSuccess
                                ? const NewsShimmer()
                                : NewsItem(
                                    newsBloc: _newsBloc,
                                    slug: state.news[index].slug,
                                    title: state.news[index].title,
                                    createdAt: state.news[index].publishDate,
                                    image: state.news[index].image.middle,
                                  ),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                          ),
                  );
                },
              ),

              /// ARTICLES
              SliverToBoxAdapter(
                child: TitlesItem(
                  title: 'Статьи',
                  showAllFunction: () {
                    Navigator.of(context).push(fade(page: const NewsPart()));
                  },
                  showAllTitle: 'Все статьи',
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 300,
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(16, 8, 0, 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const TopArticlesItem(
                        imageUrl: 'https://picsum.photos/200/300',
                        id: 5,
                        title: 'rejng;vsdnv;rsn;bnsfv',
                        createdAt: '24-03-2022',
                        category: 'Categorybfkdnsb',
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 16);
                    },
                    itemCount: 10,
                  ),
                ),
              ),

              /// TOP ORGANIZATIONS
              const SliverToBoxAdapter(
                child: TitlesItem(title: 'Лучшие организации'),
              ),
              BlocBuilder<MostPopularsBloc, MostPopularsState>(
                builder: (context, state) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 254,
                      child: Paginator(
                        scrollDirection: Axis.horizontal,
                        paginatorStatus:
                            MyFunctions.formzStatusToPaginatorStatus(
                                state.popularOrgsStatus),
                        itemBuilder: (context, index) {
                          return TopHospitalItem(
                            title: 'rke;lgka',
                            rating: 4.3,
                            address: 'vkflsdnsvlkj rgv;ekjn lknfdsbf gvser 46',
                            images: List.generate(
                              5,
                              (index) =>
                                  'https://openseauserdata.com/files/b261626a159edf64a8a92aa7306053b8.png',
                            ),
                            id: 5,
                          );
                        },
                        itemCount: 10,
                        padding:
                            const EdgeInsets.only(left: 16, bottom: 16, top: 8),
                        fetchMoreFunction: () {},
                        hasMoreToFetch: state.popularDoctorsFetchMore,
                        errorWidget: const SizedBox(),
                      ),
                    ),
                  );
                },
              ),

              /// TOP DOCTORS
              const SliverToBoxAdapter(
                child: TitlesItem(title: 'Лучшие врачи'),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  // width: MediaQuery.of(context).size.width,
                  height: 140,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return const TopDoctorItem(
                        id: 5,
                        rating: 2.5,
                        distance: 30,
                        jobs: 'Jobs Jobs',
                        name:
                            'Mrokakrvaavr jnreskvblrvsdglrjktbfsdxjkbajelrkjvbS',
                        image: 'https://picsum.photos/200/300',
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 16);
                    },
                    itemCount: 10,
                    padding:
                        const EdgeInsets.only(left: 16, top: 8, bottom: 16),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  // height: 225,
                  margin: const EdgeInsets.only(bottom: 75),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppIcons.buyPremiumBackground),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: white1),
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Активируйте подписку',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 20),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Получите доступ ко всем  платным материалам и функциям приложеним.',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            WButton(
                              onTap: () {},
                              text: 'Подробнее',
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: white),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
