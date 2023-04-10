import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/bloc/payment_card/payment_cards_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/journal/presentation/pages/add_payment_card_verify_screen.dart';
import 'package:anatomica/features/journal/presentation/widgets/add_card_btsht.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/profile/domain/usecases/create_payment_cards_usecase.dart';
import 'package:anatomica/features/profile/presentation/widgets/card_item.dart';
import 'package:anatomica/features/profile/presentation/widgets/custom_dialog.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

// ignore: must_be_immutable
class MyCardsScreen extends StatefulWidget {
  const MyCardsScreen({Key? key}) : super(key: key);

  @override
  State<MyCardsScreen> createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PaymentCardsBloc>().add(GetPaymentCardsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return CustomScreen(
      child: Scaffold(
        appBar: WAppBar(
          title: LocaleKeys.my_cards.tr(),
          hasUnderline: true,
        ),
        body: BlocBuilder<PaymentCardsBloc, PaymentCardsState>(
          builder: (context, state) {
            if (state.status.isSubmissionInProgress) {
              return const Center(child: CupertinoActivityIndicator());
            }
            if (state.status.isSubmissionSuccess) {
              return Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 20 + mediaQuery.padding.bottom),
                child: Column(
                  children: [
                    if (state.paymentCards.isNotEmpty)
                      ...List.generate(state.paymentCards.length, (index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CardItem(
                                onTapDelete: () {
                                  showCustomDialog(context,
                                      subTitle: LocaleKeys.you_are_sure_to_delete_card.tr(),
                                      title: LocaleKeys.delete_card.tr(), onConfirmTap: () {
                                    Navigator.pop(context);
                                    context.read<PaymentCardsBloc>().add(DeletePaymentCard(
                                          id: state.paymentCards[index].id,
                                          onSucces: () {},
                                          onError: (message) {
                                            context
                                                .read<ShowPopUpBloc>()
                                                .add(ShowPopUp(message: message, isSuccess: false));
                                          },
                                        ));
                                  });
                                },
                                cardType: state.paymentCards[index].cardType,
                                cardNumber: state.paymentCards[index].cardNumber),
                            if (index != state.paymentCards.length - 1)
                              const WDivider(margin: EdgeInsets.only(right: 16)),
                          ],
                        );
                      })
                    else ...{
                      const Spacer(),
                      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        SvgPicture.asset(AppIcons.emptyA),
                        const SizedBox(height: 24),
                        Text(
                          LocaleKeys.empty.tr(),
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          LocaleKeys.you_dont_have_card.tr(),
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: textSecondary),
                        )
                      ]),
                    },
                    const Spacer(),
                    WButton(
                      onTap: () async {
                        await showModalBottomSheet(
                                context: context, backgroundColor: Colors.transparent, useRootNavigator: true, isScrollControlled: true, builder: (context) => const AddCardBtsht())
                            .then((value) => {
                                  if (value is Map<String, String>)
                                    {
                                      context.read<PaymentCardsBloc>().add(CreatePaymentCardEvent(
                                            param: CreateCardParam(
                                              cardNumber: value['card_number'] as String,
                                              expireDate: value['date'] as String,
                                            ),
                                            onSucces: () {
                                              Navigator.push(
                                                  context,
                                                  fade(
                                                      page: AddPaymentCardVerifyScreen(
                                                    expiredDate: value['date'] as String,
                                                    cardNumber: value['card_number'] as String,
                                                  )));
                                            },
                                            onError: (message) {
                                              context
                                                  .read<ShowPopUpBloc>()
                                                  .add(ShowPopUp(message: message, isSuccess: false));
                                            },
                                          )),
                                    }
                                });
                      },
                      height: 40,
                      text: LocaleKeys.add_card.tr(),
                    )
                  ],
                ),
              );
            }
            return const Center(child: CupertinoActivityIndicator(color: red));
          },
        ),
      ),
    );
  }
}
