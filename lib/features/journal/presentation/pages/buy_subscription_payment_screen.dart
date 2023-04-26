import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/payment_card/payment_cards_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_cupertino_switch.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/journal/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:anatomica/features/journal/presentation/pages/add_payment_card_verify_screen.dart';
import 'package:anatomica/features/journal/presentation/pages/payment_result.dart';
import 'package:anatomica/features/journal/presentation/widgets/add_card_btsht.dart';
import 'package:anatomica/features/journal/presentation/widgets/add_card_widget.dart';
import 'package:anatomica/features/journal/presentation/widgets/buy_subscription_title.dart';
import 'package:anatomica/features/journal/presentation/widgets/cards_bottomsheet.dart';
import 'package:anatomica/features/journal/presentation/widgets/journal_images.dart';
import 'package:anatomica/features/journal/presentation/widgets/payment_card_item_widget.dart';
import 'package:anatomica/features/journal/presentation/widgets/payment_method.dart';
import 'package:anatomica/features/journal/presentation/widgets/select_period_bottom_sheet.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BuySubscription extends StatefulWidget {
  final List<ImageEntity> images;

  const BuySubscription({required this.images, Key? key}) : super(key: key);

  @override
  State<BuySubscription> createState() => _BuySubscriptionState();
}

class _BuySubscriptionState extends State<BuySubscription> {
  late PaymentBloc paymentBloc;

  bool enableAutoPayment = false;

  @override
  void initState() {
    super.initState();
    context.read<PaymentCardsBloc>().add(GetPaymentCardsEvent());
    paymentBloc = PaymentBloc(paymentId: null)..add(GetPrices());
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider(
      create: (context) => paymentBloc,
      child: CustomScreen(
        child: Scaffold(
          appBar: AppBar(
            shadowColor: appBarDivider,
            elevation: 1,
            leadingWidth: 0,
            titleSpacing: 0,
            title: const BuySubscriptionAppBarTitle(),
          ),
          body: BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, paymentState) {
              if (paymentState.getPricesStatus.isSubmissionInProgress) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (paymentState.getPricesStatus.isSubmissionSuccess) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: ListView(
                        padding: const EdgeInsets.only(bottom: 120),
                        physics: const BouncingScrollPhysics(),
                        children: [
                          const SizedBox(height: 24),
                          JournalImages(images: widget.images),
                          const SizedBox(height: 28),
                          Text.rich(
                            TextSpan(
                              text: '${MyFunctions.getFormatCostFromInt(paymentState.prices.journalSubscribe)} ',
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(color: primary, fontSize: 20),
                              children: [
                                TextSpan(
                                  text: LocaleKeys.for_month.tr(),
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(color: textColor),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            LocaleKeys.subscription_for_all_journals.tr(),
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: textColor),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            LocaleKeys.subscription_for_all_journals_description.tr(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13),
                          ),
                          const SizedBox(height: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  LocaleKeys.select_period.tr(),
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(color: textColor),
                                ),
                              ),
                              const SizedBox(height: 8),
                              WScaleAnimation(
                                onTap: () async {
                                  final periodType = await showModalBottomSheet<PeriodType>(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                    builder: (_) => SelectPeriodBottomSheet(initialPeriod: paymentState.selectedPeriod),
                                  );
                                  if (periodType != null) {
                                    paymentBloc.add(PaymentChooseEvent(selectedPeriod: periodType));
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 16),
                                  padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                                  decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(AppIcons.mapCalendar, height: 20),
                                      const SizedBox(width: 8),
                                      Text(
                                        paymentState.selectedPeriod.title.tr(),
                                        style: Theme.of(context).textTheme.displaySmall!.copyWith(color: textColor),
                                      ),
                                      const Spacer(),
                                      SvgPicture.asset(AppIcons.chevronDown, height: 24)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  LocaleKeys.select_payment_method.tr(),
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(color: textColor),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 124,
                                    child: GridView(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        physics: const NeverScrollableScrollPhysics(),
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 15,
                                            mainAxisSpacing: 16,
                                            mainAxisExtent: 54),
                                        children: PaymentType.values.map(
                                          (e) {
                                            if (e.isCard) {
                                              return const SizedBox.shrink();
                                            }
                                            return PaymentMethod(
                                              onTap: (value) {
                                                paymentBloc.add(PaymentChooseEvent(selectedPayment: e));
                                              },
                                              icon: e.icon,
                                              isSelected: paymentState.selectedPayment == e,
                                              paymentMethod: e.type,
                                              iconHeight: e.iconHeight,
                                            );
                                          },
                                        ).toList()),
                                  ),
                                  if (context.watch<AuthenticationBloc>().state.status ==
                                      AuthenticationStatus.authenticated)
                                    PaymentMethod(
                                      margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                                      onTap: (value) {
                                        paymentBloc.add(PaymentChooseEvent(selectedPayment: PaymentType.card));
                                      },
                                      isSelected: paymentState.selectedPayment?.isCard ?? false,
                                      paymentMethod: 'card',
                                      title: Text(LocaleKeys.payment_with_card.tr(),
                                          style: Theme.of(context).textTheme.displayLarge),
                                    ),
                                  BlocBuilder<PaymentCardsBloc, PaymentCardsState>(
                                    builder: (context, state) {
                                      return AnimatedCrossFade(
                                        firstChild: state.paymentCards.isEmpty
                                            ? Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                                child: AddCardWidget(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                        context: context,
                                                        backgroundColor: Colors.transparent,
                                                        useRootNavigator: true,
                                                        isScrollControlled: true,
                                                        builder: (context) => AddCardBtsht(
                                                              isWaiting: state.secondStatus.isSubmissionInProgress,
                                                              onAddCardSuccess: (cardInfo) {
                                                                Navigator.push(
                                                                    context,
                                                                    fade(
                                                                        page: AddPaymentCardVerifyScreen(
                                                                      expiredDate: cardInfo.expireDate,
                                                                      cardNumber: cardInfo.cardNumber,
                                                                    )));
                                                              },
                                                            ));
                                                  },
                                                ),
                                              )
                                            : PaymentCardItem(
                                                cardType: state.selectedCard?.cardType,
                                                cardNumber: state.selectedCard?.cardNumber,
                                                onTap: () {
                                                  showModalBottomSheet(
                                                      context: context,
                                                      backgroundColor: Colors.transparent,
                                                      useRootNavigator: true,
                                                      isScrollControlled: true,
                                                      builder: (context) => CardsBottomSheet(
                                                            onAddCardPressed: () {
                                                              // Navigator.pop(context);
                                                              showModalBottomSheet(
                                                                context: context,
                                                                backgroundColor: Colors.transparent,
                                                                useRootNavigator: true,
                                                                isScrollControlled: true,
                                                                builder: (addContext) => AddCardBtsht(
                                                                  isWaiting: state.secondStatus.isSubmissionInProgress,
                                                                  onAddCardSuccess: (cardInfo) {
                                                                    Navigator.push(
                                                                        context,
                                                                        fade(
                                                                            page: AddPaymentCardVerifyScreen(
                                                                          expiredDate: cardInfo.expireDate,
                                                                          cardNumber: cardInfo.cardNumber,
                                                                        )));
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                            cards: state.paymentCards,
                                                            selectedCard: state.selectedCard,
                                                          )).then((value) => {
                                                        if (value != null)
                                                          {
                                                            context.read<PaymentCardsBloc>().add(
                                                                SetSelectedPaymentCardEvent(
                                                                    id: value['selectedCardId']))
                                                          }
                                                      });
                                                },
                                              ),
                                        secondChild: const SizedBox(),
                                        crossFadeState: (paymentState.selectedPayment?.isCard ?? false)
                                            ? CrossFadeState.showFirst
                                            : CrossFadeState.showSecond,
                                        firstCurve: Curves.slowMiddle,
                                        duration: const Duration(milliseconds: 300),
                                      );
                                    },
                                  ),
                                  if (context.watch<AuthenticationBloc>().state.status ==
                                          AuthenticationStatus.authenticated &&
                                      (paymentState.selectedPayment?.isCard ?? false))
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        children: [
                                          WCupertinoSwitch(
                                            onChange: (val) {
                                              enableAutoPayment = val;
                                            },
                                            isSwitched: enableAutoPayment,
                                            inactiveColor: textSecondary,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            LocaleKeys.enable_auto_payment.tr(),
                                            style: Theme.of(context).textTheme.displaySmall!.copyWith(color: dark),
                                          ),
                                        ],
                                      ),
                                    )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: mediaQuery.padding.bottom + 16,
                      left: 0,
                      right: 0,
                      child: WButton(
                        isLoading: paymentState.payForMonthlyStatus.isSubmissionInProgress,
                        color: paymentState.selectedPayment == null ? textSecondary : primary,
                        onTap: () {
                          if (paymentState.selectedPayment == null) {
                            context.read<ShowPopUpBloc>().add(ShowPopUp(message: LocaleKeys.no_payment_provider.tr()));
                            return;
                          }
                          context.read<PaymentBloc>().add(PayForMonthlySubscription(
                              autoReNewJournal:
                                  !(paymentState.selectedPayment?.isCard ?? false) ? false : enableAutoPayment,
                              period: paymentState.selectedPeriod.months,
                              onSuccess: (value) {
                                if (!(paymentState.selectedPayment?.isCard ?? false)) {
                                  launchUrlString(value.transactionCheckoutUrl, mode: LaunchMode.externalApplication);
                                  Navigator.of(context).push(
                                    fade(
                                      page: PaymentResultScreen(
                                        title: LocaleKeys.activate_subscription.tr(),
                                        isRegistered: true,
                                        isSubscription: true,
                                        bloc: context.read<PaymentBloc>(),
                                      ),
                                    ),
                                  );
                                } else if ((paymentState.selectedPayment?.isCard ?? false)) {
                                  context.read<ShowPopUpBloc>().add(ShowPopUp(message: 'Uspeshno', isSuccess: true));
                                }
                              },
                              paymentProvider: paymentState.selectedPayment!.type,
                              onError: (message) {
                                context.read<ShowPopUpBloc>().add(ShowPopUp(message: message));
                              }));
                        },
                        margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
                        text: LocaleKeys.confirm.tr(),
                      ),
                    ),
                  ],
                );
              } else if (paymentState.getPricesStatus.isSubmissionFailure) {
                return const Center(
                  child: Text('Error'),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
