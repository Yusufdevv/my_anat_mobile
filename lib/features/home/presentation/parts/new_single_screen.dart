import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/home/presentation/blocs/news_bloc/news_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:formz/formz.dart';

class NewSingleScreen extends StatelessWidget {
  final String slug;
  final NewsBloc bloc;

  const NewSingleScreen({required this.slug, required this.bloc, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(NewsEvent.getNewSingle(slug: slug)),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          elevation: 1,
          title: HospitalSingleAppBarBody(
              shareValue: 'https://anatomica.uz/news/$slug'),
          shadowColor: textFieldColor,
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state.newSingleStatus.isSubmissionInProgress) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state.newSingleStatus.isSubmissionSuccess) {
              return ListView(
                padding: const EdgeInsets.all(16)
                    .copyWith(bottom: MediaQuery.of(context).padding.bottom),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                        imageUrl: state.newSingle!.image.middle),
                  ),
                  Html(
                    data: state.newSingle!.description,
                    style: {
                      'p': Style(
                        fontSize: FontSize.medium,
                        color: textColor,
                      ),
                    },
                  ),
                ],
              );
            } else if (state.newSingleStatus.isSubmissionFailure) {
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
