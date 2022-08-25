import 'package:anatomica/features/map/presentation/widgets/article_item.dart';
import 'package:flutter/material.dart';

class HospitalArticles extends StatelessWidget {
  const HospitalArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
      itemBuilder: (context, index) => const HospitalArticleItem(),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}