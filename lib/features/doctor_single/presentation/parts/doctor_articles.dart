import 'package:anatomica/features/magazine/domain/entities/article_entity.dart';
import 'package:anatomica/features/map/presentation/widgets/article_item.dart';
import 'package:flutter/material.dart';

class DoctorArticles extends StatelessWidget {
  const DoctorArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
      itemBuilder: (context, index) => const  HospitalArticleItem(entity: JournalArticleEntity(),),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
