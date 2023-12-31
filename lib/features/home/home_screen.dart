import 'dart:developer';
import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/shimmer_container.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/home/presentation/blocs/category_bloc/category_bloc.dart';
import 'package:anatomica/features/home/presentation/blocs/home_articles_bloc/home_articles_bloc.dart';
import 'package:anatomica/features/home/presentation/blocs/most_populars_bloc/most_populars_bloc.dart';
import 'package:anatomica/features/home/presentation/blocs/news_bloc/news_bloc.dart';
import 'package:anatomica/features/home/presentation/blocs/notification_bloc/notification_bloc.dart';
import 'package:anatomica/features/home/presentation/widgets/categories_screen.dart';
import 'package:anatomica/features/home/presentation/parts/main_search.dart';
import 'package:anatomica/features/home/presentation/parts/news_part.dart';
import 'package:anatomica/features/home/presentation/parts/notifications.dart';
import 'package:anatomica/features/home/presentation/parts/other_categories_screen.dart';
import 'package:anatomica/features/home/presentation/widgets/banner_item.dart';
import 'package:anatomica/features/home/presentation/widgets/category_item.dart';
import 'package:anatomica/features/home/presentation/widgets/category_shimmer.dart';
import 'package:anatomica/features/home/presentation/widgets/news_item.dart';
import 'package:anatomica/features/home/presentation/widgets/news_shimmer.dart';
import 'package:anatomica/features/home/presentation/widgets/titles_item.dart';
import 'package:anatomica/features/home/presentation/widgets/top_articles_item.dart';
import 'package:anatomica/features/home/presentation/widgets/top_doctor_item.dart';
import 'package:anatomica/features/home/presentation/widgets/top_hospital_item.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/journal/presentation/widgets/activate_premium.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/web_view/web_view_screen.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> with TickerProviderStateMixin {
  late CategoryBloc _categoryBloc;
  late HomeArticlesBloc _homeArticlesBloc;
  late MostPopularsBloc _mostPopularsBloc;
  late NotificationBloc _notificationBloc;
  late NewsBloc _newsBloc;
  late ScrollController _scrollController;
  ValueNotifier<bool> isShrink = ValueNotifier(false);

  @override
  void initState() {
    _categoryBloc = CategoryBloc()..add(const CategoryEvent.getCategories());
    context.read<JournalBloc>().add(GetJournals());
    _homeArticlesBloc = HomeArticlesBloc()
      ..add(const HomeArticlesEvent.getHomeArticles())
      ..add(const HomeArticlesEvent.getBanners());
    _mostPopularsBloc = MostPopularsBloc()
      ..add(const MostPopularsEvent.getPopularOrgs());
    _notificationBloc = NotificationBloc()
      ..add(const NotificationEvent.unreadNotifications());
    getDoctors();
    _newsBloc = NewsBloc()..add(const NewsEvent.getNews());
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset > 200 - kToolbarHeight &&
            !isShrink.value) {
          isShrink.value = true;
        } else if (_scrollController.offset < 200 - kToolbarHeight &&
            isShrink.value) {
          isShrink.value = false;
        }
      });
    super.initState();
  }

  getDoctors() async {
    try {
      await MyFunctions.determinePosition().then((value) async {
        await StorageRepository.putDouble(StoreKeys.latitude, value.latitude);
        await StorageRepository.putDouble(StoreKeys.longitude, value.longitude);
        _mostPopularsBloc.add(const MostPopularsEvent.getPopularDoctors());
      });
    } on Exception {
      _mostPopularsBloc.add(const MostPopularsEvent.getPopularDoctors());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _categoryBloc),
          BlocProvider.value(value: _mostPopularsBloc),
          BlocProvider.value(value: _newsBloc),
          BlocProvider.value(value: _homeArticlesBloc),
          BlocProvider.value(value: _notificationBloc),
        ],
        child: Scaffold(
          backgroundColor: errorImageBackground,
          body: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              AnimatedBuilder(
                builder: (context, child) {
                  return SliverAppBar(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness: isShrink.value
                            ? Brightness.dark
                            : Brightness.light),
                    pinned: true,
                    backgroundColor: errorImageBackground,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(16),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<HomeArticlesBloc, HomeArticlesState>(
                          builder: (context, homeArticleState) {
                            print('state => ${homeArticleState.isDownloaded}');
                            return AnimatedCrossFade(
                              crossFadeState: !homeArticleState.isDownloaded
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              secondChild: SvgPicture.asset(
                                AppIcons.anatomica,
                                width: 128,
                                height: 28,
                                color: black,
                              ),
                              firstChild: SvgPicture.asset(
                                AppIcons.anatomica,
                                width: 128,
                                height: 28,
                                color: isShrink.value ? black : white,
                              ),
                              duration: const Duration(milliseconds: 250),
                            );
                          },
                        ),
                        if (context.read<AuthenticationBloc>().state.status !=
                            AuthenticationStatus.authenticated) ...{
                          const Spacer()
                        } else ...{
                          BlocBuilder<NotificationBloc, NotificationState>(
                            builder: (context, notificationState) {
                              return WScaleAnimation(
                                child: notificationState.unreadNotification !=
                                            null &&
                                        notificationState
                                            .unreadNotification!.unread
                                    ? SvgPicture.asset(
                                        isShrink.value
                                            ? AppIcons
                                                .blackNotificationWithRedDot
                                            : AppIcons.notificationWithRedDot,
                                      )
                                    : SvgPicture.asset(
                                        AppIcons.bell,
                                        color: isShrink.value ? black : white,
                                      ),
                                onTap: () =>
                                    Navigator.of(context, rootNavigator: true)
                                        .push(
                                  fade(
                                    page: NotificationsScreen(
                                      notificationBloc: _notificationBloc,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        },
                      ],
                    ),
                    expandedHeight: 324,
                    elevation: 0,
                    scrolledUnderElevation: 0,
                    flexibleSpace:
                        BlocBuilder<HomeArticlesBloc, HomeArticlesState>(
                      builder: (context, state) {
                        return state.bannersStatus !=
                                FormzStatus.submissionSuccess
                            ? const ShimmerContainer(
                                width: double.maxFinite, height: 324)
                            : BannerItem(
                                ids: state.banners.map((e) => e.id).toList(),
                                isShrink: isShrink.value,
                                images: state.banners
                                    .map((e) => e.image.middle)
                                    .toList(),
                                subtitles: state.banners
                                    .map((e) => e.subtitle)
                                    .toList(),
                                titles:
                                    state.banners.map((e) => e.title).toList(),
                                types:
                                    state.banners.map((e) => e.type).toList(),
                              );
                      },
                    ),
                  );
                },
                animation: isShrink,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: MainSearchPart(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        fade(
                          page: const WebViewScreen(
                            page: '',
                            url: 'https://anatomica.uz/search',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 16),
                      child: state.categoryStatus !=
                              FormzStatus.submissionSuccess
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
                                    logo: state.categories[index].icon.file.url,
                                    title: state.categories[index].title,
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .push(fade(
                                              page: BlocProvider.value(
                                        value: _categoryBloc,
                                        child: CategoriesScreen(
                                          mediaQuery: MediaQuery.of(context),
                                          selectedIndex: index,
                                          categoryItemSize:
                                              (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      48) /
                                                  3,
                                        ),
                                      )));
                                    },
                                  ),
                                ),
                                if (state.categories.length > 5)
                                  CategoryItem(
                                    logo: AppIcons.moreVertical,
                                    title: LocaleKeys.others.tr(),
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .push(fade(
                                              page: BlocProvider.value(
                                                  value: _categoryBloc,
                                                  child:
                                                      const OtherCategoriesScreen())));
                                    },
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
                  title: LocaleKeys.news.tr(),
                  showAllFunction: () {
                    Navigator.of(context, rootNavigator: true)
                        .push(fade(page: const NewsPart()));
                  },
                  showAllTitle: LocaleKeys.all_news.tr(),
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
                                    createdAt: MyFunctions.getPublishedDate(
                                        state.news[index].publishDate),
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
                  title: LocaleKeys.articles.tr(),
                  showAllFunction: () {
                    Navigator.of(context, rootNavigator: true).push(
                      fade(
                        page: const WebViewScreen(
                          page: '',
                          url: 'https://anatomica.uz/articles',
                        ),
                      ),
                    );
                  },
                  showAllTitle: LocaleKeys.all_articles.tr(),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 300,
                  child: BlocBuilder<HomeArticlesBloc, HomeArticlesState>(
                    builder: (context, state) {
                      return Paginator(
                        errorWidget: Container(),
                        fetchMoreFunction: () {},
                        hasMoreToFetch: false,
                        paginatorStatus:
                            MyFunctions.formzStatusToPaginatorStatus(
                                state.homeArticlesStatus),
                        padding: const EdgeInsets.fromLTRB(16, 8, 0, 16),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return TopArticlesItem(
                            imageUrl: state.homeArticles[index].image.middle,
                            id: state.homeArticles[index].id,
                            title: state.homeArticles[index].title,
                            createdAt: MyFunctions.getPublishedDate(
                                state.homeArticles[index].publishDate),
                            category: state.homeArticles[index].category.title,
                            slug: state.homeArticles[index].slug,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 16);
                        },
                        itemCount: state.homeArticles.length,
                      );
                    },
                  ),
                ),
              ),

              /// TOP ORGANIZATIONS
              SliverToBoxAdapter(
                child: TitlesItem(title: LocaleKeys.popular_orgs.tr()),
              ),
              BlocBuilder<MostPopularsBloc, MostPopularsState>(
                builder: (context, state) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: 254,
                      child: Paginator(
                        scrollDirection: Axis.horizontal,
                        paginatorStatus:
                            MyFunctions.formzStatusToPaginatorStatus(
                                state.popularOrgsStatus),
                        itemBuilder: (context, index) {
                          return TopHospitalItem(
                            slug: state.popularOrgs[index].slug,
                            title: state.popularOrgs[index].title,
                            rating: state.popularOrgs[index].rating,
                            address: state.popularOrgs[index].address,
                            images: state.popularOrgs[index].images
                                .map((e) => e.middle)
                                .toList(),
                            id: state.popularOrgs[index].id,
                          );
                        },
                        itemCount: state.popularOrgs.length,
                        padding:
                            const EdgeInsets.only(left: 16, bottom: 16, top: 8),
                        fetchMoreFunction: () {},
                        hasMoreToFetch: false,
                        errorWidget: const SizedBox(),
                      ),
                    ),
                  );
                },
              ),

              /// TOP DOCTORS

              BlocBuilder<MostPopularsBloc, MostPopularsState>(
                builder: (context, state) {
                  return state.popularDoctors.isNotEmpty
                      ? SliverToBoxAdapter(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitlesItem(
                                  title: LocaleKeys.the_best_doctors.tr()),
                              SizedBox(
                                height: 140,
                                child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return TopDoctorItem(
                                      id: state.popularDoctors[index].id,
                                      rating: state.popularDoctors[index].rating
                                          as double,
                                      distance:
                                          state.popularDoctors[index].distance,
                                      jobs: state
                                          .popularDoctors[index].specializations
                                          .map((e) => e.title)
                                          .toList()
                                          .join(' '),
                                      name: state
                                          .popularDoctors[index].doctorName,
                                      image: state
                                          .popularDoctors[index].image.middle,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(width: 16);
                                  },
                                  itemCount: state.popularDoctors.length,
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 8, bottom: 16),
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SliverToBoxAdapter(child: SizedBox());
                },
              ),
              if (!context
                  .watch<AuthenticationBloc>()
                  .state
                  .user
                  .isSubscribed) ...{
                BlocBuilder<JournalBloc, JournalState>(
                  builder: (context, state) {
                    return ActivatePremium(
                        images: state.journals.map((e) => e.image).toList());
                  },
                ),
              },

              SliverToBoxAdapter(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * .125)),
            ],
          ),
        ),
      ),
    );
  }
}
