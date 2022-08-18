import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/magazine/domain/entity/magazine_item_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatefulWidget {
  final MagazineItemEntity magazineItemEntity;
  final EdgeInsets margin;

  const ArticleItem(
      {required this.magazineItemEntity,
      this.margin = EdgeInsets.zero,
      Key? key})
      : super(key: key);

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: divider),
                borderRadius: BorderRadius.circular(8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: widget.magazineItemEntity.imageUrl,
                fit: BoxFit.cover,
                width: 90,
                height: 79,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.magazineItemEntity.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      widget.magazineItemEntity.authorName,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 3,
                      width: 3,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: textSecondary),
                    ),
                    Text(
                      widget.magazineItemEntity.today,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
