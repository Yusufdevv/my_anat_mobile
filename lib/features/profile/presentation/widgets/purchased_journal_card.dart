import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/profile/data/models/purchased_journal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PurchasedJournalCard extends StatelessWidget {
  final PurchasedJournalModel entity;

  const PurchasedJournalCard({required this.entity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(8),
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
              entity.name,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              entity.name,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
            ),


          ],

        ),
      );
}
