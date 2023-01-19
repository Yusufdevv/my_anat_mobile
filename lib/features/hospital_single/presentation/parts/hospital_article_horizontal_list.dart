import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/h_articles/h_articles_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/all_hospital_items_screen.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_articles.dart';
import 'package:anatomica/features/hospital_single/presentation/widgets/show_all_button.dart';
import 'package:anatomica/features/journal/domain/entities/article_entity.dart';
import 'package:anatomica/features/map/presentation/widgets/article_item.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HospitalArticlesHorizontalList extends StatelessWidget {
  final int hospitalId;

  const HospitalArticlesHorizontalList({required this.hospitalId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(top: 12, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16),
            child: Text(
              LocaleKeys.articles.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: textColor),
            ),
          ),
          BlocBuilder<HArticlesBloc, HArticlesState>(
            builder: (context, state) {
              final List<JournalArticleEntity> hospitalArticles = state.articles.where((element) => element.id == hospitalId).toList();
              print('state articles => $hospitalArticles');
              print('hospital articles => ${state.articles}');
              if (state.status.isSubmissionInProgress) {
                return const SizedBox(
                  height: 98,
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                );
              } else if (state.status.isSubmissionSuccess) {
                if (state.articles.isEmpty) {
                  return Center(
                    child: EmptyWidget(
                      hasMargin: false,
                      hasPadding: false,
                      title: LocaleKeys.no_articles.tr(),
                      content: LocaleKeys.no_articles.tr(),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 98,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: state.articles.length > 5
                          ? state.articles.take(6).length
                          : state.articles.length,
                      itemBuilder: (context, index) {
                        if (index == 5) {
                          return ShowAllButton(
                            title: LocaleKeys.all_articles.tr(),
                            width:
                                MediaQuery.of(context).size.shortestSide - 32,
                            onTap: () {
                              Navigator.of(context).push(
                                fade(
                                  page: AllHospitalItemsScreen(
                                    appbarTitle: LocaleKeys.articles.tr(),
                                    child: HospitalArticles(
                                      bloc: context.read<HArticlesBloc>(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        return SizedBox(
                          width: MediaQuery.of(context).size.shortestSide - 32,
                          child: HospitalArticleItem(
                            showShadow: false,
                            entity: state.articles[index]
                                ,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                    ),
                  );
                }
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
