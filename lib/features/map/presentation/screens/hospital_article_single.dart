import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:anatomica/features/journal/data/repositories/journal_repository_impl.dart';
import 'package:anatomica/features/journal/domain/usecases/get_journal_article_single_usecase.dart';
import 'package:anatomica/features/map/presentation/blocs/article_single_bloc/article_single_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:formz/formz.dart';

class HospitalArticleSingle extends StatelessWidget {
  final String slug;

  const HospitalArticleSingle({required this.slug, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleSingleBloc(
          getJournalArticleSingleUseCase:
              GetJournalArticleSingleUseCase(repository: serviceLocator<JournalRepositoryImpl>()))
        ..add(
          ArticleSingleEvent.getSingleArticle(slug: slug),
        ),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leadingWidth: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: white,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          automaticallyImplyLeading: false,
          elevation: 1,
          title: HospitalSingleAppBarBody(
            shareValue: 'https://anatomica.uz/article/$slug',
          ),
          shadowColor: textFieldColor,
        ),
        body: BlocBuilder<ArticleSingleBloc, ArticleSingleState>(
          builder: (context, state) {
            if (state.getSingleStatus.isSubmissionSuccess) {
              return ListView(
                padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
                children: [
                  WImage(
                    imageUrl: state.articleSingle.image.middle,
                    borderRadius: BorderRadius.circular(8),
                    onErrorWidget: const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 12),
                  Html(data: state.articleSingle.description),
                ],
              );
            } else if (state.getSingleStatus.isSubmissionInProgress) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state.getSingleStatus.isSubmissionFailure) {
              return const Center(
                child: Text('error'),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
