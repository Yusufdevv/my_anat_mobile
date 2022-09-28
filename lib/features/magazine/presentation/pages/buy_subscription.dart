import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/data/repositories/payment_repository_impl.dart';
import 'package:anatomica/features/magazine/domain/entities/period_entity.dart';
import 'package:anatomica/features/magazine/domain/usecases/check_payment_status_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/get_prices_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/order_create_article_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/order_create_journal_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/pay_for_monthly_subscription_usecase.dart';
import 'package:anatomica/features/magazine/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:anatomica/features/magazine/presentation/pages/onetime_expect.dart';
import 'package:anatomica/features/magazine/presentation/widgets/journal_images.dart';
import 'package:anatomica/features/magazine/presentation/widgets/payment_method.dart';
import 'package:anatomica/features/magazine/presentation/widgets/select_period_bottom_sheet.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
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
  String currentPaymentMethod = '';
  PeriodEntity currentPeriod = const PeriodEntity(title: '30 дней', period: 1);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider(
      create: (context) => PaymentBloc(
        orderCreateJournalUseCase: OrderCreateJournalUseCase(repository: serviceLocator<PaymentRepositoryImpl>()),
        orderCreateArticleUseCase: OrderCreateArticleUseCase(repository: serviceLocator<PaymentRepositoryImpl>()),
        checkPaymentStatusUseCase: CheckPaymentStatusUseCase(repository: serviceLocator<PaymentRepositoryImpl>()),
        getPricesUseCase: GetPricesUseCase(repository: serviceLocator<PaymentRepositoryImpl>()),
        payForMonthlySubscriptionUseCase:
            PayForMonthlySubscriptionUseCase(repository: serviceLocator<PaymentRepositoryImpl>()),
      )..add(GetPrices()),
      child: CustomScreen(
        child: Scaffold(
          appBar: AppBar(
            shadowColor: appBarDivider,
            elevation: 1,
            leadingWidth: 0,
            titleSpacing: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 56),
                Text(
                  'Активировать подписку',
                  style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor, fontSize: 20),
                ),
                WScaleAnimation(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                    child: SvgPicture.asset(
                      AppIcons.close,
                      color: black,
                    ),
                  ),
                ),
              ],
            ),
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
                            style: Theme.of(context).textTheme.headline1!.copyWith(color: primary, fontSize: 20),
                            children: [
                              TextSpan(
                                text: 'в месяц',
                                style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Подписка на все журналы',
                          style: Theme.of(context).textTheme.headline4!.copyWith(color: textColor),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Активировав подписку, вы получаете\nдоступ ко всем журналам',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 13),
                        ),
                        const SizedBox(height: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                'Выберите длительность',
                                style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
                              ),
                            ),
                            const SizedBox(height: 8),
                            WScaleAnimation(
                              onTap: () async {
                                final periodEntity = await showModalBottomSheet<PeriodEntity>(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  builder: (_) => SelectPeriodBottomSheet(
                                    initialPeriod: currentPeriod,
                                  ),
                                );
                                if (periodEntity != null) {
                                  setState(() {
                                    currentPeriod = periodEntity;
                                  });
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
                                    SvgPicture.asset(
                                      AppIcons.mapCalendar,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      currentPeriod.title,
                                      style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(
                                      AppIcons.chevronDown,
                                      height: 24,
                                    )
                                  ],
                                ),
                              ),
                            )
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
                                  'Выберите длительность',
                                  style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Expanded(
                                child: GridView(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 16, mainAxisExtent: 54),
                                  children: [
                                    PaymentMethod(
                                      onTap: (value) {
                                        setState(() {
                                          currentPaymentMethod = value;
                                        });
                                      },
                                      icon: AppImages.payMe,
                                      currentPaymentMethod: currentPaymentMethod,
                                      paymentMethod: 'payme',
                                      iconHeight: 24,
                                    ),
                                    PaymentMethod(
                                      onTap: (value) {
                                        setState(() {
                                          currentPaymentMethod = value;
                                        });
                                      },
                                      iconHeight: 26,
                                      icon: AppImages.click,
                                      currentPaymentMethod: currentPaymentMethod,
                                      paymentMethod: 'click',
                                    ),
                                    PaymentMethod(
                                      onTap: (value) {
                                        setState(() {
                                          currentPaymentMethod = value;
                                        });
                                      },
                                      iconHeight: 22,
                                      icon: AppImages.apelsin,
                                      currentPaymentMethod: currentPaymentMethod,
                                      paymentMethod: 'apelsin',
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        WButton(
                          isLoading: state.payForMonthlyStatus.isSubmissionInProgress,
                          onTap: () {
                            context.read<PaymentBloc>().add(PayForMonthlySubscription(
                                period: currentPeriod.period,
                                onSuccess: (value) {
                                  launchUrlString(value.transactionCheckoutUrl, mode: LaunchMode.externalApplication);
                                  Navigator.of(context).push(
                                    fade(
                                      page: OneTimeExpect(
                                        isRegistered: true,
                                        bloc: context.read<PaymentBloc>(),
                                      ),
                                    ),
                                  );
                                },
                                paymentProvider: currentPaymentMethod,
                                onError: (message) {
                                  context.read<ShowPopUpBloc>().add(ShowPopUp(message: message));
                                }));
                          },
                          margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
                          text: 'Подтвердить',
                        ),
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
