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
import 'package:anatomica/features/magazine/data/repositories/payment_repository_impl.dart';
import 'package:anatomica/features/magazine/domain/usecases/order_create_article_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/order_create_journal_usecase.dart';
import 'package:anatomica/features/magazine/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:anatomica/features/magazine/presentation/pages/onetime_expect.dart';
import 'package:anatomica/features/magazine/presentation/widgets/payment_method.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class OneTimePayment extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final int price;
  final int id;
  final bool isJournal;
  final bool isRegistered;
  const OneTimePayment(
      {required this.price,
      required this.title,
      required this.imageUrl,
      required this.isJournal,
      required this.isRegistered,
      required this.subtitle,
      required this.id,
      Key? key})
      : super(key: key);

  @override
  State<OneTimePayment> createState() => _OneTimePaymentState();
}

class _OneTimePaymentState extends State<OneTimePayment>
    with TickerProviderStateMixin {
  late TabController controller;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  String currentPaymentMethod = '';
  bool isPhone = true;
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
      ),
      child: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          return CustomScreen(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                elevation: 1,
                shadowColor: textFieldColor,
                toolbarHeight: !widget.isRegistered ? 120 : 52,
                titleSpacing: 0,
                leadingWidth: 0,
                automaticallyImplyLeading: false,
                title: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 13, right: 16, left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Text(
                            widget.isRegistered
                                ? 'Покупка журнала'
                                : LocaleKeys.only_pay.tr(),
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          const Spacer(),
                          WScaleAnimation(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              AppIcons.close,
                              color: black,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (!widget.isRegistered) ...[
                      const Divider(
                        color: appBarDivider,
                        height: 0,
                        thickness: 1,
                      ),
                      Container(
                        height: 36,
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.all(16),
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
                          labelStyle: Theme.of(context).textTheme.headline3,
                          labelColor: textColor,
                          onTap: (index) {},
                          unselectedLabelColor: textSecondary,
                          tabs: const [
                            Tab(text: 'Номер телефона'),
                            Tab(text: 'Электронная почта'),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!widget.isRegistered) ...{
                    SizedBox(
                      height: 105,
                      child: TabBarView(
                          controller: controller,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 16, 16, 24),
                              child: PhoneTextField(
                                controller: phoneController,
                                title: 'Номер телефона',
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 16, 16, 24),
                              child: DefaultTextField(
                                title: 'Электронная почта',
                                controller: emailController,
                                onChanged: (value) {},
                                prefix: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12, right: 8),
                                  child: SvgPicture.asset(AppIcons.mail),
                                ),
                                hintText: 'example@anatomica.uz',
                              ),
                            ),
                          ]),
                    ),
                  },
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16)
                        .copyWith(top: widget.isRegistered ? 16 : 0),
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
                              imageUrl: widget.imageUrl,
                              fit: BoxFit.cover,
                              height: 120,
                              width: 120,
                              // width: double.infinity,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                    )),
                            const SizedBox(height: 4),
                            Text(
                              widget.subtitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              MyFunctions.getFormatCostFromInt(widget.price),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Text(
                      'Выберите способ оплаты',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Expanded(
                    child: GridView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            setState(() {
                              currentPaymentMethod = value;
                            });
                          },
                          icon: AppImages.payMe,
                          currentPaymentMethod: currentPaymentMethod,
                          paymentMethod: 'payme',
                        ),
                        PaymentMethod(
                          onTap: (value) {
                            setState(() {
                              currentPaymentMethod = value;
                            });
                          },
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
                          icon: AppImages.apelsin,
                          currentPaymentMethod: currentPaymentMethod,
                          paymentMethod: 'apelsin',
                        )
                      ],
                    ),
                  ),
                  WButton(
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom + 16,
                        left: 16,
                        right: 16),
                    onTap: () {
                      if (currentPaymentMethod.isEmpty) {
                        context
                            .read<ShowPopUpBloc>()
                            .add(ShowPopUp(message: 'To\'lov turini tanlang'));
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
                                  email: !isPhone ? emailController.text : '',
                                  paymentProvider: currentPaymentMethod,
                                  onSuccess: (value) {
                                    launchUrlString(value,
                                        mode: LaunchMode.externalApplication);
                                  },
                                  onError: (message) {
                                    context
                                        .read<ShowPopUpBloc>()
                                        .add(ShowPopUp(message: message));
                                  },
                                ),
                              );
                        } else {
                          context.read<PaymentBloc>().add(
                                OrderCreateArticle(
                                  isRegistered: widget.isRegistered,
                                  articleId: widget.id,
                                  price: widget.price,
                                  phone: isPhone
                                      ? "+998${phoneController.text.replaceAll(' ', '')}"
                                      : '',
                                  email: !isPhone ? emailController.text : '',
                                  paymentProvider: currentPaymentMethod,
                                  onSuccess: (value) {
                                    launchUrlString(value,
                                        mode: LaunchMode.externalApplication);
                                    Navigator.of(context).push(fade(
                                        page: OneTimeExpect(
                                      isRegistered: widget.isRegistered,
                                    )));
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
                    text: 'Подтвердить',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
