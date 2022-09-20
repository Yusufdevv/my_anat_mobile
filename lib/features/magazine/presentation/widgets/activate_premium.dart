import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ActivatePremium extends StatelessWidget {
  const ActivatePremium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.magazineBack), fit: BoxFit.cover),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border.all(color: white1),
              borderRadius: BorderRadius.circular(16),
              color: white.withOpacity(0.6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.active_follow.tr(),
                style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 8),
              Text(
                LocaleKeys.get_access.tr(),
                style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 13, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  WButton(
                    borderRadius: 6,
                    height: 34,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    onTap: () {},
                    child: Text(
                      LocaleKeys.more.tr(),
                      style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
