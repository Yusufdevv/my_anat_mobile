import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/payment_card/payment_cards_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/journal/domain/entities/period_entity.dart';
import 'package:anatomica/features/journal/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:anatomica/features/journal/presentation/pages/add_payment_card_verify_screen.dart';
import 'package:anatomica/features/journal/presentation/pages/payment_result.dart';
import 'package:anatomica/features/journal/presentation/widgets/add_card_btsht.dart';
import 'package:anatomica/features/journal/presentation/widgets/add_card_widget.dart';
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
  final ValueNotifier currentPeriod = ValueNotifier(const PeriodEntity(title: LocaleKeys.days_30, period: 1));
  String currentPeriodTitle = LocaleKeys.days_30;
  Map<String, String> payments = {
    'payme': AppImages.payMe,
    'click': AppImages.click,
    'uzum': AppImages.uzum,
    'paylov': AppImages.paylov
  };
  List<double> iconHeights = [24, 24, 22, 22];
  final ValueNotifier currentPaymentMethod = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider(
      create: (context) => PaymentBloc(paymentId: null)..add(GetPrices()),
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
            builder: (context, state) {
              if (state.getPricesStatus.isSubmissionInProgress) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.getPricesStatus.isSubmissionSuccess) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: mediaQuery.size.height - mediaQuery.padding.top - kToolbarHeight),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        JournalImages(images: widget.images),
                        const SizedBox(height: 28),
                        Text.rich(
                          TextSpan(
                            text: '${MyFunctions.getFormatCostFromInt(state.prices.journalSubscribe)} ',
                            style: Theme.of(context).textTheme.displayLarge!.copyWith(color: primary, fontSize: 20),
                            children: [
                              TextSpan(
                                text: LocaleKeys.for_month.tr(),
                                style: Theme.of(context).textTheme.displaySmall!.copyWith(color: textColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          LocaleKeys.subscription_for_all_journals.tr(),
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: textColor),
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
                            ValueListenableBuilder(
                                valueListenable: currentPeriod,
                                builder: (ctx, _, __) {
                                  return WScaleAnimation(
                                    onTap: () async {
                                      final periodEntity = await showModalBottomSheet<PeriodEntity>(
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        isScrollControlled: true,
                                        builder: (_) => SelectPeriodBottomSheet(initialPeriod: currentPeriod.value),
                                      );
                                      if (periodEntity != null) {
                                        currentPeriod.value = periodEntity;
                                        currentPeriodTitle = periodEntity.title;
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
                                            currentPeriodTitle.tr(),
                                            style: Theme.of(context).textTheme.displaySmall!.copyWith(color: textColor),
                                          ),
                                          const Spacer(),
                                          SvgPicture.asset(AppIcons.chevronDown, height: 24)
                                        ],
                                      ),
                                    ),
                                  );
                                })
                          ],
                        ),
                        const SizedBox(height: 24),
                        Expanded(
                          child: Column(
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
                              ValueListenableBuilder(
                                  valueListenable: currentPaymentMethod,
                                  builder: (context, _, __) {
                                    return Column(
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
                                            children: List.generate(
                                              iconHeights.length,
                                              (index) => PaymentMethod(
                                                  onTap: (value) {
                                                    currentPaymentMethod.value = value;
                                                  },
                                                  icon: payments.values.toList()[index],
                                                  currentPaymentMethod: currentPaymentMethod.value,
                                                  paymentMethod: payments.keys.toList()[index],
                                                  iconHeight: iconHeights[index]),
                                            ),
                                          ),
                                        ),
                                        if (context.watch<AuthenticationBloc>().state.status ==
                                            AuthenticationStatus.authenticated)
                                          PaymentMethod(
                                            margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                                            onTap: (value) {
                                              currentPaymentMethod.value = value;
                                            },
                                            currentPaymentMethod: currentPaymentMethod.value,
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
                                                                    isWaiting:
                                                                        state.secondStatus.isSubmissionInProgress,
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
                                                                        isWaiting:
                                                                            state.secondStatus.isSubmissionInProgress,
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
                                              crossFadeState: currentPaymentMethod.value == 'card'
                                                  ? CrossFadeState.showFirst
                                                  : CrossFadeState.showSecond,
                                              firstCurve: Curves.slowMiddle,
                                              duration: const Duration(milliseconds: 300),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  }),
                            ],
                          ),
                        ),
                        ValueListenableBuilder(
                            valueListenable: currentPaymentMethod,
                            builder: (context, _, __) {
                              return WButton(
                                isLoading: state.payForMonthlyStatus.isSubmissionInProgress,
                                color: currentPaymentMethod.value.isEmpty ? textSecondary : primary,
                                onTap: () {
                                  if (currentPaymentMethod.value.isEmpty) {
                                    context
                                        .read<ShowPopUpBloc>()
                                        .add(ShowPopUp(message: LocaleKeys.no_payment_provider.tr()));
                                    return;
                                  }
                                  context.read<PaymentBloc>().add(PayForMonthlySubscription(
                                      period: currentPeriod.value.period,
                                      onSuccess: (value) {
                                        if (currentPaymentMethod.value != 'card') {
                                          launchUrlString(value.transactionCheckoutUrl,
                                              mode: LaunchMode.externalApplication);
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
                                        } else if (currentPaymentMethod.value == 'card') {
                                          context
                                              .read<ShowPopUpBloc>()
                                              .add(ShowPopUp(message: 'Uspeshno', isSuccess: true));
                                        }
                                      },
                                      paymentProvider: currentPaymentMethod.value,
                                      onError: (message) {
                                        context.read<ShowPopUpBloc>().add(ShowPopUp(message: message));
                                      }));
                                },
                                margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
                                text: LocaleKeys.confirm.tr(),
                              );
                            }),
                        SizedBox(height: mediaQuery.padding.bottom + 16)
                      ],
                    ),
                  ),
                );
              } else if (state.getPricesStatus.isSubmissionFailure) {
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

class BuySubscriptionAppBarTitle extends StatelessWidget {
  const BuySubscriptionAppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 56),
        Text(
          LocaleKeys.activate_subscription.tr(),
          style: Theme.of(context).textTheme.displaySmall!.copyWith(color: textColor, fontSize: 20),
        ),
        WScaleAnimation(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: SvgPicture.asset(AppIcons.close, color: black),
          ),
        ),
      ],
    );
  }
}
