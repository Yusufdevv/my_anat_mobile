import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/journal/presentation/widgets/add_card_btsht.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCardsScreen extends StatelessWidget {
  MyCardsScreen({Key? key}) : super(key: key);
  List<String> cards = ['humo', 'uzcard'];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return CustomScreen(
      child: Scaffold(
        appBar: WAppBar(
          title: LocaleKeys.my_cards.tr(),
          hasUnderline: true,
        ),
        body: Padding(
          padding:
              EdgeInsets.fromLTRB(16, 0, 16, 20 + mediaQuery.padding.bottom),
          child: Column(
            children: [
              ...List.generate(cards.length, (index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CardItem(
                        cardType: cards[index],
                        cardNumber: '8600 49** **** **04'),
                    if (index != cards.length - 1)
                      const WDivider(margin: EdgeInsets.only(right: 16)),
                  ],
                );
              }),
              const Spacer(),
              WButton(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      useRootNavigator: true,
                      isScrollControlled: true,
                      builder: (context) => const AddCardBtsht());
                },
                height: 40,
                text: LocaleKeys.to_main.tr(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String cardType;
  final String cardNumber;

  const CardItem({
    super.key,
    required this.cardType,
    required this.cardNumber,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            cardType == 'humo'
                ? SvgPicture.asset(AppImages.humo)
                : SvgPicture.asset(AppImages.uzcard),
            const SizedBox(width: 8),
            Text(cardNumber, style: Theme.of(context).textTheme.displayLarge)
          ],
        ),
      );
}
