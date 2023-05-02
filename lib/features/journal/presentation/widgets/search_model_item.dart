import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/highlighted_text.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/journal/domain/entities/journal_entity.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchedModelsItem extends StatelessWidget {
  final TextEditingController controller;
  final JournalEntity magazineItemEntity;

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
                imageUrl: magazineItemEntity.image.middle,
                fit: BoxFit.cover,
                height: 232,
                width: 164,
              ),
            ),
          ),
          const SizedBox(height: 12),
          HighlightedText(
            textStyleHighlight: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
            textStyle: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
            allText: magazineItemEntity.name,
            highlightedText: controller.text,
            highlightColor: yellowHighlightedText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            MyFunctions.getFormatCostFromInt(magazineItemEntity.price),
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
          ),
          WButton(
            width: 164,
            margin: const EdgeInsets.only(top: 12),
            onTap: () {},
            child: Text(
              MyFunctions.getFormatCostFromInt(magazineItemEntity.price),
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      );
}
