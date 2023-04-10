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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: backgroundColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                title,
                style: mainTextStyle ??
                    Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w600),
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
            style: mainTextStyle ??
                Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
