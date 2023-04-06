import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/home/presentation/blocs/news_bloc/news_bloc.dart';
import 'package:anatomica/features/home/presentation/widgets/news_item.dart';
import 'package:anatomica/features/home/presentation/widgets/news_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class NewsPart extends StatefulWidget {
  const NewsPart({Key? key}) : super(key: key);

  @override
  State<NewsPart> createState() => _NewsPartState();
}

class _NewsPartState extends State<NewsPart> {
  late NewsBloc bloc;

  @override
  void initState() {
    bloc = NewsBloc()..add(const NewsEvent.getNews());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        backgroundColor: errorImageBackground,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: white,
          elevation: 0,
          leadingWidth: 0,
          title: Row(
            children: [
              WScaleAnimation(
                child: SvgPicture.asset(
                  AppIcons.chevronLeft,
                  color: textSecondary,
                  height: 24,
                  width: 24,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Новости',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return state.newsStatus != FormzStatus.submissionSuccess
                ? ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) => const NewsShimmer(),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  )
                // TODO edit params
                : Paginator(
                    hasMoreToFetch: state.newsFetchMore,
                    fetchMoreFunction: () {
                      bloc.add(const NewsEvent.getMoreNews());
                    },
                    paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(
                        state.newsStatus),
                    errorWidget: const Text('error'),
                    emptyWidget: const SizedBox(),
                    itemCount: state.news.length,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(16).copyWith(
                        bottom: MediaQuery.of(context).padding.bottom + 16),
                    itemBuilder: (context, index) => NewsItem(
                      image: state.news[index].image.middle,
                      slug: state.news[index].slug,
                      newsBloc: bloc,
                      createdAt: state.news[index].publishDate,
                      title: state.news[index].title,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                  );
          },
        ),
      ),
    );
  }
}
