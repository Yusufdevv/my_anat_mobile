import 'dart:developer';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/profile/presentation/widgets/text_in_row.dart';
import 'package:flutter/material.dart';

class PurchasedHistoryItem extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final String summ;
  final String? purchasedAt;
  final TextStyle? mainTextStyle;

  const PurchasedHistoryItem(
      {required this.title,
      required this.backgroundColor,
      this.purchasedAt,
      required this.summ,
      this.mainTextStyle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(':::::::::: purchased history item title:  ${title}  ::::::::::');
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: whiteSmoke2),
      child: Column(
        children: [
          TextInRow(title: 'title', amount: 7766779),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: mainTextStyle ??
                        Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
                  ),
                  if (purchasedAt != null)
                    Text(
                      purchasedAt!,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                ],
              ),
              Text(
                summ,
                style:
                    mainTextStyle ?? Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
