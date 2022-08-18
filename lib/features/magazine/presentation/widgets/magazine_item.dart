import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/magazine/domain/entity/magazine_item_entity.dart';
import 'package:anatomica/features/magazine/presentation/widgets/buy_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MagazineItem extends StatefulWidget {
  final MagazineItemEntity magazineItemEntity;
  final EdgeInsets margin;
  final bool isBuyText;

  const MagazineItem(
      {required this.magazineItemEntity,
      this.margin = EdgeInsets.zero,
      this.isBuyText = false,
      Key? key})
      : super(key: key);

  @override
  State<MagazineItem> createState() => _MagazineItemState();
}

class _MagazineItemState extends State<MagazineItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 492,
                decoration: BoxDecoration(
                    border: Border.all(color: divider),
                    borderRadius: BorderRadius.circular(8)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    imageUrl: widget.magazineItemEntity.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: black.withOpacity(0.4),
                  ),
                  child: Text(
                    widget.magazineItemEntity.today,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 3,
                width: 3,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: textSecondary),
              ),
              Text(
                widget.magazineItemEntity.title,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          widget.isBuyText
              ? Row(
                  children: [
                    Expanded(
                      child: WButton(
                        border: Border.all(color: primary),
                        color: unFollowButton,
                        margin: const EdgeInsets.only(top: 12),
                        onTap: () {},
                        child: Text(
                          'Предпросмотр',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: WButton(
                        margin: const EdgeInsets.only(top: 12),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => const BuyDialog(),
                          );
                        },
                        child: Text(
                          'Купить',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: WButton(
                        borderRadius: 6,
                        margin: const EdgeInsets.only(top: 12),
                        onTap: () {},
                        child: Text(
                          widget.magazineItemEntity.price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: WButton(
                        borderRadius: 6,
                        border: Border.all(color: primary),
                        color: unFollowButton,
                        margin: const EdgeInsets.only(top: 12),
                        onTap: () {},
                        child: Text(
                          'Оформить подписку',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
