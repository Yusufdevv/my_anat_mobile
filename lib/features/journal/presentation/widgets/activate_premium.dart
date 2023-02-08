import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/register_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/journal/presentation/pages/buy_subscription.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivatePremium extends StatelessWidget {
  final List<ImageEntity> images;
  const ActivatePremium({required this.images, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.magazineBack), fit: BoxFit.cover),
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
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 20),
              ),
              const SizedBox(height: 8),
              Text(
                LocaleKeys.get_access.tr(),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      return WButton(
                        borderRadius: 6,
                        height: 34,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        onTap: () {
                          if (state.status ==
                              AuthenticationStatus.authenticated) {
                            Navigator.of(context, rootNavigator: true).push(
                              fade(
                                page: BuySubscription(
                                  images: images,
                                ),
                              ),
                            );
                          } else {
                            showRegisterBottomSheet(context);
                          }
                        },
                        child: Text(
                          LocaleKeys.more.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      );
                    },
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
