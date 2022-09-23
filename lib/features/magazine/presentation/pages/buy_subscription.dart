import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/presentation/widgets/journal_image_item.dart';
import 'package:anatomica/features/magazine/presentation/widgets/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuySubscription extends StatefulWidget {
  final List<ImageEntity> images;

  const BuySubscription({required this.images, Key? key}) : super(key: key);

  @override
  State<BuySubscription> createState() => _BuySubscriptionState();
}

class _BuySubscriptionState extends State<BuySubscription> {
  String currentPaymentMethod = '';
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: mediaQuery.size.height - mediaQuery.padding.top - kToolbarHeight),
          child: Column(
            children: [
              const SizedBox(height: 24),
              JournalImages(images: widget.images),
              const SizedBox(height: 28),
              Text.rich(
                TextSpan(
                  text: '119 900 UZS ',
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
                  Container(
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
                          '30 дней',
                          style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          AppIcons.chevronDown,
                          height: 24,
                        )
                      ],
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
                onTap: () {},
                margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
                text: 'Подтвердить',
              ),
              SizedBox(height: mediaQuery.padding.bottom + 16)
            ],
          ),
        ),
      ),
    );
  }
}

class JournalImages extends StatelessWidget {
  final List<ImageEntity> images;
  const JournalImages({
    required this.images,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const SizedBox.shrink();
    }
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: images.length >= 3
            ? [
                Positioned(
                  left: -48,
                  child: JournalImageItem(image: images.first),
                ),
                Positioned(
                  right: -48,
                  child: JournalImageItem(image: images[1]),
                ),
                JournalImageItem(
                  image: images[2],
                  height: 160,
                  width: 116,
                ),
              ]
            : [
                JournalImageItem(
                  image: images.first,
                  height: 160,
                  width: 116,
                ),
              ],
      ),
    );
  }
}
