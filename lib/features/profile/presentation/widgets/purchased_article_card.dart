import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/profile/data/models/purchased_article.dart';
import 'package:flutter/material.dart';

class PurchasedArticleCard extends StatelessWidget {
  final PurchasedArticleModel entity;

  const PurchasedArticleCard({required this.entity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 230,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x17246A52),
                  blurRadius: 24,
                  offset: Offset(0, 9))
            ]),
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.network(
              entity.images.isNotEmpty ? entity.images.first.middle : '',
              errorBuilder: (e, b, c) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[300]),
                );
              },
            )),
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), color: white),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entity.title,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        entity.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      );
}
