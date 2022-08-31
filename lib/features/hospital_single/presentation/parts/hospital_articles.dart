import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/h_articles/h_articles_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/article_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalArticles extends StatefulWidget {
  const HospitalArticles({Key? key}) : super(key: key);

  @override
  State<HospitalArticles> createState() => _HospitalArticlesState();
}

class _HospitalArticlesState extends State<HospitalArticles> {
  late HArticlesBloc articlesBloc;

  @override
  void initState() {
    articlesBloc = HArticlesBloc(GetHArticlesUseCase())
      ..add(HArticlesEvent.getArticles());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: articlesBloc,
      child: BlocBuilder<HArticlesBloc, HArticlesState>(
        builder: (context, state) {
          return ListView.separated(
            itemCount: state.articles.length,
            padding: const EdgeInsets.all(16)
                .copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
            itemBuilder: (context, index) =>  HospitalArticleItem(entity: state.articles[index],),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          );
        },
      ),
    );
  }
}
