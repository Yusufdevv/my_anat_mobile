import 'dart:developer';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/journal/domain/entities/product_entity.dart';
import 'package:anatomica/features/profile/presentation/widgets/text_in_row.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PurchasedHistoryItem extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final String summ;
  final String? purchasedAt;
  final TextStyle? mainTextStyle;
  final List<ProductEntity> products;

  const PurchasedHistoryItem({
    required this.products,
    required this.title,
    required this.backgroundColor,
    this.purchasedAt,
    required this.summ,
    this.mainTextStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: whiteSmoke2),
      child: Column(
        children: [
          ...products
              .map(
                (e) => TextInRow(title: e.data.name, amount: e.data.price),
              )
              .toList(),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (purchasedAt != null)
                Text(
                  purchasedAt!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${LocaleKeys.all.tr()}:',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    summ,
                    style: mainTextStyle ??
                        Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
