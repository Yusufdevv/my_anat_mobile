import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/auth/presentation/pages/register.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/journal/domain/entities/journal_entity.dart';
import 'package:anatomica/features/journal/presentation/pages/buy_journal_payment_screen.dart';
import 'package:anatomica/features/journal/presentation/widgets/buy_dialog.dart';
import 'package:anatomica/features/markdown_reader/presentation/pages/journal_markdown_reader.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MagazineSmallItem extends StatelessWidget {
  final JournalEntity journalEntity;
  final EdgeInsets margin;
  final VoidCallback onPaymentSuccess;

  const MagazineSmallItem({
    required this.journalEntity,
    this.margin = EdgeInsets.zero,
    Key? key,
    required this.onPaymentSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: divider), borderRadius: BorderRadius.circular(8)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: journalEntity.image.middle,
                    fit: BoxFit.cover,
                    height: 232,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                journalEntity.redaction,
                maxLines: 1,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              if (!(journalEntity.isBought || !journalEntity.isPremium)) ...{
                Text(
                  MyFunctions.getFormatCostFromInt(journalEntity.price),
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 13, fontWeight: FontWeight.w700),
                ),
              } else ...{
                Text(
                  !journalEntity.isPremium
                      ? LocaleKeys.free.tr()
                      : journalEntity.isBought
                          ? LocaleKeys.bought.tr()
                          : '',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 13, fontWeight: FontWeight.w600, color: primary),
                ),
              }
            ],
          ),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return WButton(
                margin: const EdgeInsets.only(top: 12),
                onTap: () {
                  if (journalEntity.isBought || !journalEntity.isPremium) {
                    Navigator.of(context, rootNavigator: true).push(
                      fade(
                        page: JournalMarkdownPageReader(
                          title: journalEntity.redaction,
                          slug: journalEntity.slug,
                        ),
                      ),
                    );
                  } else {
                    if (state.status == AuthenticationStatus.unauthenticated) {
                      showDialog(
                        context: context,
                        builder: (ctx) => BuyDialog(
                          onPaymentTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                              fade(
                                page: OneTimePaymentScreen(
                                  onPaymentSuccess: onPaymentSuccess,
                                  slug: journalEntity.slug,
                                  price: journalEntity.price,
                                  title: journalEntity.redaction,
                                  imageUrl: journalEntity.image.middle,
                                  isJournal: true,
                                  isRegistered: false,
                                  subtitle: journalEntity.redaction,
                                  id: journalEntity.id,
                                ),
                              ),
                            );
                          },
                          onRegistrationTap: () {
                            Navigator.of(context).push(fade(page: const RegisterScreen()));
                          },
                        ),
                      );
                    } else {
                      Navigator.of(context, rootNavigator: true).push(
                        fade(
                          page: OneTimePaymentScreen(
                            onPaymentSuccess: onPaymentSuccess,
                            slug: journalEntity.slug,
                            price: journalEntity.price,
                            title: journalEntity.redaction,
                            imageUrl: journalEntity.image.middle,
                            isJournal: true,
                            isRegistered: true,
                            subtitle: journalEntity.redaction,
                            id: journalEntity.id,
                          ),
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  journalEntity.isBought || !journalEntity.isPremium ? LocaleKeys.read.tr() : LocaleKeys.buy.tr(),
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
