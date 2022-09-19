import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/doctor_single/presentation/blocs/doctor_articles_bloc/doctor_articles_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/article_item.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorArticles extends StatelessWidget {
  final int doctorId;
  const DoctorArticles({required this.doctorId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorArticlesBloc, DoctorArticlesState>(
      builder: (context, state) {
        return Paginator(
          hasMoreToFetch: state.fetchMore,
          fetchMoreFunction: () {
            context.read<DoctorArticlesBloc>().add(GetMoreDoctorArticles());
          },
          paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(state.getArticleStatus),
          errorWidget: const Text('error'),
          emptyWidget: const EmptyWidget(
            content: 'Shifokor maqola yozmagan',
            title: 'Shifokor maqola yozmagan',
          ),
          itemCount: state.articles.length,
          padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
          itemBuilder: (context, index) => HospitalArticleItem(
            entity: state.articles[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        );
      },
    );
  }
}
