import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/journal/domain/entities/journal_entity.dart';
import 'package:anatomica/features/journal/domain/entities/tag_entity.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/journal/presentation/pages/journal_single_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/profile/data/models/purchased_journal.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchasedJournalCard extends StatelessWidget {
  final PurchasedJournalModel entity;

  const PurchasedJournalCard({required this.entity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.of(context).push(fade(
              page: JournalSingleScreen(
            bloc: context.read<JournalBloc>(),
            journal: JournalEntity(
                category: CategoryEntity(
                  id: entity.category.id,
                  title: entity.category.title,
                ),
                id: entity.id,
                description: entity.description,
                name: entity.name,
                slug: entity.slug,
                organization: entity.organization,
                image: ImageEntity(
                  id: entity.image.id,
                  middle: entity.image.middle,
                  small: entity.image.small,
                  origin: entity.image.origin,
                ),
                price: entity.price.toInt(),
                fileExtension: entity.fileExtension,
                isBought: entity.isBought,
                isPremium: entity.isPremium,
                publishDate: entity.publishDate,
                redaction: entity.redaction,
                tags: entity.tags.map((e) => TagEntity(title: e.title, id: e.id)).toList()),
          )));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                entity.image.middle,
                height: 230,
                errorBuilder: (c, b, d) => Container(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              entity.redaction,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ],
        ),
      );
}
