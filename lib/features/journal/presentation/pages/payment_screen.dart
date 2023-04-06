import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/default_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/phone_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/journal/data/repositories/payment_repository_impl.dart';
import 'package:anatomica/features/journal/domain/usecases/check_payment_status_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/get_prices_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/order_create_article_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/order_create_journal_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/pay_for_monthly_subscription_usecase.dart';
import 'package:anatomica/features/journal/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:anatomica/features/journal/presentation/pages/payment_result.dart';
import 'package:anatomica/features/journal/presentation/widgets/cards_bottomsheet.dart';
import 'package:anatomica/features/journal/presentation/widgets/payment_method.dart';
import 'package:anatomica/features/markdown_reader/presentation/pages/journal_markdown_reader.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PaymentScreen extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final int price;
  final int id;
  final bool isJournal;
  final bool isRegistered;
  final String slug;

  const PaymentScreen(
      {required this.price,
      required this.title,
      required this.imageUrl,
      required this.isJournal,
      required this.isRegistered,
      required this.subtitle,
      required this.id,
      required this.slug,
      Key? key})
      : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with TickerProviderStateMixin {
  late TabController controller;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  final ValueNotifier currentPaymentMethod = ValueNotifier<String>('');
  bool isPhone = true;
  final ValueNotifier _inputState =
      ValueNotifier<CrossFadeState>(CrossFadeState.showFirst);

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this)
      ..addListener(() {
        if (controller.index == 1) {
          isPhone = false;
        } else {
          isPhone = true;
        }
      });
    phoneController = TextEditingController();
    emailController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(
        orderCreateArticleUseCase: OrderCreateArticleUseCase(
            repository: serviceLocator<PaymentRepositoryImpl>()),
        orderCreateJournalUseCase: OrderCreateJournalUseCase(
            repository: serviceLocator<PaymentRepositoryImpl>()),
        checkPaymentStatusUseCase: CheckPaymentStatusUseCase(
            repository: serviceLocator<PaymentRepositoryImpl>()),
        getPricesUseCase: GetPricesUseCase(
            repository: serviceLocator<PaymentRepositoryImpl>()),
        payForMonthlySubscriptionUseCase: PayForMonthlySubscriptionUseCase(
            repository: serviceLocator<PaymentRepositoryImpl>()),
      ),
      child: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          return CustomScreen(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                elevation: 1,
                shadowColor: textFieldColor,
                toolbarHeight: 52,
                titleSpacing: 0,
                leadingWidth: 0,
                automaticallyImplyLeading: false,
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: WScaleAnimation(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 16),
                                child: SvgPicture.asset(
                                  AppIcons.chevronLeft,
                                  color: textSecondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          widget.isRegistered
                              ? LocaleKeys.buy_magazine.tr()
                              : LocaleKeys.only_pay.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: textColor, fontSize: 20),
                        ),
                        const Spacer()
                      ],
                    ),
                  ],
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JournalArticleItem(
                    title: widget.title,
                    price: widget.price,
                    imageUrl: widget.imageUrl,
                    slug: widget.slug,
                  ),
                  if (!widget.isRegistered) ...[
                    const Divider(
                      height: 0,
                      thickness: 1,
                      color: textFieldColor,
                    ),
                    Container(
                      height: 36,
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.all(16).copyWith(bottom: 0),
                      decoration: BoxDecoration(
                        color: textFieldColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TabBar(
                        physics: const BouncingScrollPhysics(),
                        controller: controller,
                        padding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.zero,
                        indicator: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        labelPadding: EdgeInsets.zero,
                        labelStyle: Theme.of(context).textTheme.displaySmall,
                        labelColor: textColor,
                        onTap: (index) {
                          if (index == 0) {
                            // setState(() {
                            // });
                            _inputState.value = CrossFadeState.showFirst;
                          } else {
                            // setState(() {
                            // });
                            _inputState.value = CrossFadeState.showSecond;
                          }
                        },
                        unselectedLabelColor: textSecondary,
                        tabs: [
                          Tab(text: LocaleKeys.phone_number.tr()),
                          Tab(text: LocaleKeys.mail.tr()),
                        ],
                      ),
                    ),
                    ValueListenableBuilder(
                        valueListenable: _inputState,
                        builder: (context, ob, child) {
                          return AnimatedCrossFade(
                            duration: const Duration(milliseconds: 150),
                            crossFadeState: _inputState.value,
                            firstChild: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 20, 16, 24),
                              child: PhoneTextField(
                                hasError:
                                    state.orderCreateStatus.isSubmissionFailure,
                                controller: phoneController,
                                title: LocaleKeys.phone_number.tr(),
                              ),
                            ),
                            secondChild: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 20, 16, 24),
                              child: DefaultTextField(
                                title: LocaleKeys.mail.tr(),
                                controller: emailController,
                                hasError:
                                    state.orderCreateStatus.isSubmissionFailure,
                                onChanged: (value) {},
                                prefix: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12, right: 8),
                                  child: SvgPicture.asset(AppIcons.mail),
                                ),
                                hintText: 'example@anatomica.uz',
                              ),
                            ),
                          );
                        })
                  ],
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: Text(
                      LocaleKeys.select_payment_method.tr(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: currentPaymentMethod,
                      builder: (context, _, __) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 124,
                              child: GridView(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 15,
                                        mainAxisSpacing: 16,
                                        mainAxisExtent: 54),
                                children: [
                                  PaymentMethod(
                                    onTap: (value) {
                                      currentPaymentMethod.value = value;
                                    },
                                    icon: AppImages.payMe,
                                    currentPaymentMethod:
                                        currentPaymentMethod.value,
                                    paymentMethod: 'payme',
                                    iconHeight: 24,
                                  ),
                                  PaymentMethod(
                                    onTap: (value) {
                                      currentPaymentMethod.value = value;
                                    },
                                    iconHeight: 26,
                                    icon: AppImages.click,
                                    currentPaymentMethod:
                                        currentPaymentMethod.value,
                                    paymentMethod: 'click',
                                  ),
                                  PaymentMethod(
                                    onTap: (value) {
                                      currentPaymentMethod.value = value;
                                    },
                                    iconHeight: 22,
                                    icon: AppImages.uzum,
                                    currentPaymentMethod:
                                        currentPaymentMethod.value,
                                    paymentMethod: 'uzum',
                                  ),
                                  PaymentMethod(
                                    onTap: (value) {
                                      currentPaymentMethod.value = value;
                                    },
                                    iconHeight: 22,
                                    icon: AppImages.paylov,
                                    currentPaymentMethod:
                                        currentPaymentMethod.value,
                                    paymentMethod: 'paylov',
                                  ),
                                ],
                              ),
                            ),
                            PaymentMethod(
                              margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                              onTap: (value) {
                                currentPaymentMethod.value = value;
                              },
                              currentPaymentMethod: currentPaymentMethod.value,
                              paymentMethod: 'card',
                              title: Text(
                                'Оплата с картой',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                            AnimatedCrossFade(
                              firstChild: Container(
                                margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                padding:
                                    const EdgeInsets.fromLTRB(12, 10, 10, 10),
                                decoration: BoxDecoration(
                                  color: lilyWhite,
                                  border: Border.all(color: lilyWhite),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 150),
                                      child: true
                                          ? SvgPicture.asset(
                                              AppIcons.paymentMethodCheck)
                                          : Container(
                                              height: 24,
                                              width: 24,
                                              decoration: const BoxDecoration(
                                                  color: checkUnselected,
                                                  shape: BoxShape.circle),
                                            ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        '8600 49** **** **04',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                    ),
                                    WScaleAnimation(
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            useRootNavigator: true,
                                            builder: (context) =>
                                                CardsBottomSheet());
                                      },
                                      child: Container(
                                        height: 36,
                                        width: 36,
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: textSecondary.withOpacity(.16),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: SvgPicture.asset(
                                            AppIcons.chevronsUpDown),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              secondChild: const SizedBox(),
                              crossFadeState:
                                  currentPaymentMethod.value == 'card'
                                      ? CrossFadeState.showFirst
                                      : CrossFadeState.showSecond,
                              firstCurve: Curves.slowMiddle,
                              duration: const Duration(milliseconds: 300),
                            ),
                          ],
                        );
                      }),
                  const Spacer(),
                  ValueListenableBuilder(
                      valueListenable: currentPaymentMethod,
                      builder: (context, _, __) {
                        return WButton(
                          height: 40,
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).padding.bottom + 16,
                            left: 16,
                            right: 16,
                          ),
                          color: currentPaymentMethod.value.isEmpty
                              ? textSecondary
                              : null,
                          onTap: () {
                            if (currentPaymentMethod.value.isEmpty) {
                              context.read<ShowPopUpBloc>().add(ShowPopUp(
                                  message: LocaleKeys.no_payment_provider));
                            } else {
                              if (widget.isJournal) {
                                context.read<PaymentBloc>().add(
                                      OrderCreateJournal(
                                        journalId: widget.id,
                                        price: widget.price,
                                        isRegistered: widget.isRegistered,
                                        phone: isPhone
                                            ? "+998${phoneController.text.replaceAll(' ', '')}"
                                            : '',
                                        email: !isPhone
                                            ? emailController.text
                                            : '',
                                        paymentProvider:
                                            currentPaymentMethod.value,
                                        onSuccess: (value) {
                                          launchUrlString(value,
                                              mode: LaunchMode
                                                  .externalApplication);
                                          Navigator.of(context).push(
                                            fade(
                                              page: PaymentResultScreen(
                                                title: widget.title,
                                                isRegistered:
                                                    widget.isRegistered,
                                                bloc:
                                                    context.read<PaymentBloc>(),
                                              ),
                                            ),
                                          );
                                        },
                                        onError: (message) {
                                          context
                                              .read<ShowPopUpBloc>()
                                              .add(ShowPopUp(message: message));
                                        },
                                      ),
                                    );
                              }
                            }
                          },
                          text: LocaleKeys.confirm.tr(),
                        );
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class JournalArticleItem extends StatelessWidget {
  const JournalArticleItem({
    required this.price,
    required this.title,
    required this.imageUrl,
    required this.slug,
    Key? key,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final String slug;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 161,
      padding: const EdgeInsets.symmetric(horizontal: 16)
          .copyWith(top: 16, bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: divider),
                borderRadius: BorderRadius.circular(8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                height: 120,
                width: 120,
                // width: double.infinity,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  MyFunctions.getFormatCostFromInt(price),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 20),
                ),
                const Spacer(),
                WButton(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                      fade(
                        page: JournalMarkdownPageReader(
                          title: title,
                          slug: slug,
                          isPreview: true,
                        ),
                      ),
                    );
                  },
                  height: 40,
                  text: 'Читать фрагмент',
                  textColor: primary,
                  color: unFollowButton.withOpacity(0.1),
                  border: Border.all(color: primary),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
