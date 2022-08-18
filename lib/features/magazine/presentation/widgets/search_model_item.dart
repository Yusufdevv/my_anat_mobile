import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/magazine/domain/entity/magazine_item_entity.dart';
import 'package:anatomica/features/magazine/presentation/widgets/w_highlited_textfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchedModelsItem extends StatelessWidget {
  final TextEditingController controller;
  final MagazineItemEntity magazineItemEntity;

  const SearchedModelsItem(
      {required this.controller, required this.magazineItemEntity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: divider),
                borderRadius: BorderRadius.circular(8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: magazineItemEntity.imageUrl,
                fit: BoxFit.cover,
                height: 232,
                width: 164,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              WHighlightedText(
                highlightedTextStyle: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                textStyle: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                allText: magazineItemEntity.date,
                highlightedText: controller.text,
                highlightColor: yellowHighlightedText,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            magazineItemEntity.authorName,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
          ),
          WButton(
            width: 164,
            margin: const EdgeInsets.only(top: 12),
            onTap: () {},
            child: Text(
              magazineItemEntity.price.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      );
}

/*Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        margin: const EdgeInsets.only(bottom: 1),
        color: black,
        child: Row(
          children: [
            Image.asset(magazineItemEntity.imageUrl),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'Автомобили',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: divider),
                )
              ],
            ),
          ],
        ),
      );*/
