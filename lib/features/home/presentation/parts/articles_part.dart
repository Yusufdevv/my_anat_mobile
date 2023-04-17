import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/home/presentation/blocs/home_articles_bloc/home_articles_bloc.dart';
import 'package:anatomica/features/home/presentation/widgets/top_articles_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticlesPart extends StatefulWidget {
  const ArticlesPart({Key? key}) : super(key: key);

  @override
  State<ArticlesPart> createState() => _ArticlesPartState();
}

class _ArticlesPartState extends State<ArticlesPart> {
  late HomeArticlesBloc bloc;

  @override
  void initState() {
    bloc = HomeArticlesBloc()..add(const HomeArticlesEvent.getHomeArticles());
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
                    'Статьи',
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
        body: BlocBuilder<HomeArticlesBloc, HomeArticlesState>(
          builder: (context, state) {
            return Paginator(
              errorWidget: Container(),
              fetchMoreFunction: () {
                bloc.add(const HomeArticlesEvent.getMoreHomeArticles());
              },
              hasMoreToFetch: state.homeArticlesFetchMore,
              paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(
                  state.homeArticlesStatus),
              padding: const EdgeInsets.fromLTRB(16, 8, 0, 16),
              scrollDirection: Axis.vertical,
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
    );
  }
}
