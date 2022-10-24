import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:formz/formz.dart';

class JournalArticleSingle extends StatelessWidget {
  final JournalBloc bloc;
  final String slug;

  const JournalArticleSingle({required this.bloc, required this.slug, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc..add(GetSingleArticle(slug: slug)),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          elevation: 1,
          title: HospitalSingleAppBarBody(shareValue: 'https://anatomica.uz/article/$slug'),
          shadowColor: textFieldColor,
        ),
        body: BlocBuilder<JournalBloc, JournalState>(
          builder: (context, state) {
            if (state.articleSingleStatus.isSubmissionInProgress) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state.articleSingleStatus.isSubmissionSuccess) {
              return ListView(
                padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: state.articleSingle.image.middle,
                    ),
                  ),
                  Html(
                    data: state.articleSingle.description,
                    style: {
                      'p': Style(
                        fontSize: FontSize.medium,
                        color: textColor,
                      ),
                    },
                  ),
                ],
              );
            } else if (state.articleSingleStatus.isSubmissionFailure) {
              return const Center(
                child: Text('error'),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
