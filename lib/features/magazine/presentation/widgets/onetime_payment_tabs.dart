import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/common/presentation/widgets/phone_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/domain/entity/magazine_item_entity.dart';
import 'package:anatomica/features/magazine/presentation/pages/onetime_check.dart';
import 'package:anatomica/features/magazine/presentation/pages/onetime_expect.dart';
import 'package:anatomica/features/magazine/presentation/pages/onetime_failure.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OneTimePaymentTabs extends StatefulWidget {
  final MagazineItemEntity magazineItemEntity;
  final VoidCallback onTap;

  const OneTimePaymentTabs(
      {required this.magazineItemEntity, required this.onTap, Key? key})
      : super(key: key);

  @override
  State<OneTimePaymentTabs> createState() => _OneTimePaymentTabsState();
}

class _OneTimePaymentTabsState extends State<OneTimePaymentTabs>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool? isConnected;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Номер телефона',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          const SizedBox(height: 8),
          PhoneTextField(
            controller: TextEditingController(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: WScaleAnimation(
              onTap: widget.onTap,
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
                        imageUrl: widget.magazineItemEntity.imageUrl,
                        fit: BoxFit.cover,
                        height: 120,
                        width: 120,
                        // width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    children: [
                      Text(widget.magazineItemEntity.date,
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  )),
                      const SizedBox(height: 4),
                      Text(
                        widget.magazineItemEntity.authorName,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.magazineItemEntity.price.toString(),
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
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Номер телефона',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 54),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: lilyWhite,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(AppImages.payMe),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                      color: lilyWhite,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(AppImages.click),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      color: lilyWhite,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(AppImages.apelsin),
                )
              ],
            ),
          ),
          WButton(
            margin:
                EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            onTap: () {
              Navigator.push(
                  context,
                  fade(
                      page: isConnected == true
                          ? OneTimeCheck()
                          : isConnected == false
                              ? OneTimeFailure()
                              : OneTimeExpect()));
            },
            text: 'Подтвердить',
          ),
        ],
      ),
    );
  }
}
