import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/journal/presentation/widgets/article_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllArticlesScreen extends StatelessWidget {
  final JournalBloc bloc;
  const AllArticlesScreen({required this.bloc, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          shadowColor: textFieldColor,
          automaticallyImplyLeading: false,
          leadingWidth: 0,
          titleSpacing: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WScaleAnimation(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(
                    AppIcons.chevronLeft,
                    color: textSecondary,
                  ),
                ),
              ),
              Text(
                LocaleKeys.all_articles.tr(),
                style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 20, color: textColor),
              ),
              const SizedBox(
                width: 56,
              )
            ],
          ),
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
        ),
        body: BlocBuilder<JournalBloc, JournalState>(
          builder: (context, state) {
            return Paginator(
                padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                paginatorStatus: state.journalArticleStatus,
                itemBuilder: (context, index) => ArticleItem(magazineItemEntity: state.journalArticles[index]),
                itemCount: state.journalArticles.length,
                fetchMoreFunction: () {
                  context.read<JournalBloc>().add(GetMoreJournalArticles());
                },
                hasMoreToFetch: state.journalArticleFetchMore,
                errorWidget: const Text('error'));
          },
        ),
      ),
    );
  }
}
