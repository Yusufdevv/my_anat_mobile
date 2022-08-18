import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/domain/entity/magazine_item_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MagazineSmallItem extends StatefulWidget {
  final MagazineItemEntity magazineItemEntity;
  final EdgeInsets margin;
  final VoidCallback onTap;

  const MagazineSmallItem(
      {required this.magazineItemEntity,
      this.margin = EdgeInsets.zero,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  State<MagazineSmallItem> createState() => _MagazineSmallItemState();
}

class _MagazineSmallItemState extends State<MagazineSmallItem> {
  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: widget.onTap,
      child: Container(
        margin: widget.margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: 232,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(widget.magazineItemEntity.date,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  widget.magazineItemEntity.authorName,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            WButton(
              margin: const EdgeInsets.only(top: 12),
              onTap: () {},
              child: Text(
                widget.magazineItemEntity.price.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
