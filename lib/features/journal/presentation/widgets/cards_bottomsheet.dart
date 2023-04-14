import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/common/presentation/widgets/w_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/journal/presentation/widgets/add_card_widget.dart';
import 'package:anatomica/features/profile/domain/entities/payment_card_entity.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardsBottomSheet extends StatefulWidget {
  const CardsBottomSheet({
    required this.cards,
    this.selectedCard,
    Key? key,
    required this.onAddCardPressed,
  }) : super(key: key);
  final List<PaymentCardEntity> cards;
  final PaymentCardEntity? selectedCard;
  final VoidCallback onAddCardPressed;

  @override
  State<CardsBottomSheet> createState() => _CardsBottomSheetState();
}

class _CardsBottomSheetState extends State<CardsBottomSheet> {
  final ValueNotifier groupValue = ValueNotifier<int?>(null);

  @override
  void initState() {
    super.initState();
    groupValue.value = widget.selectedCard?.id;
  }

  @override
  Widget build(BuildContext context) {
    return WBottomSheet(
      hasBackButton: false,
      contentPadding: EdgeInsets.only(left: 16, top: 14, bottom: 4 + MediaQuery.of(context).padding.bottom),
      children: [
        ValueListenableBuilder(
            valueListenable: groupValue,
            builder: (ctx, _, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.cards.tr(),
                    style:
                        Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  const WDivider(),
                  if (widget.cards.isNotEmpty)
                    ...List.generate(
                      widget.cards.length,
                      (index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CardRadioTile(
                            cardNumber: widget.cards[index].cardNumber,
                            cardType: widget.cards[index].cardType,
                            value: widget.cards[index].id,
                            groupValue: groupValue,
                          ),
                          const WDivider(margin: EdgeInsets.only(right: 16)),
                        ],
                      ),
                    ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: AddCardWidget(
                      onTap: widget.onAddCardPressed,
                    ),
                  ),
                  const SizedBox(height: 20),
                  WButton(
                    onTap: () {
                      Navigator.pop(context, {'selectedCardId': groupValue.value});
                    },
                    height: 40,
                    margin: const EdgeInsets.only(
                      bottom: 16,
                      right: 16,
                    ),
                    text: LocaleKeys.confirm.tr(),
                  )
                ],
              );
            }),
      ],
    );
  }
}

class CardRadioTile extends StatelessWidget {
  final String cardNumber;
  final int value;
  final ValueNotifier groupValue;
  final String cardType;

  const CardRadioTile({
    required this.cardNumber,
    required this.value,
    required this.groupValue,
    required this.cardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          groupValue.value = value;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              SizedBox(
                height: 28,
                width: 28,
                child: Radio(
                  value: value,
                  groupValue: groupValue.value,
                  onChanged: (val) {
                    groupValue.value = val;
                  },
                ),
              ),
              const SizedBox(width: 8),
              cardType == 'humo' ? SvgPicture.asset(AppImages.humo) : SvgPicture.asset(AppImages.uzcard),
              const SizedBox(width: 8),
              Text(cardNumber, style: Theme.of(context).textTheme.displayLarge)
            ],
          ),
        ),
      );
}
