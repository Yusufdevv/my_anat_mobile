import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/magazine/presentation/pages/journal_article_single.dart';
import 'package:anatomica/features/magazine/presentation/pages/onetime_payment.dart';
import 'package:anatomica/features/magazine/presentation/widgets/buy_dialog.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class FirstArticle extends StatelessWidget {
  final JournalState state;
  const FirstArticle({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16).copyWith(top: 0),
        child: Column(
          children: [
            WScaleAnimation(
              onTap: () {
                if (state.journalArticles.first.isBought || !state.journalArticles.first.isPremium) {
                  Navigator.of(context).push(
                    fade(
                      page: JournalArticleSingle(
                        bloc: context.read<JournalBloc>(),
                        slug: state.firstArticle.slug,
                      ),
                    ),
                  );
                } else {
                  if (context.read<AuthenticationBloc>().state.status == AuthenticationStatus.authenticated) {
                    Navigator.of(context).push(
                      fade(
                        page: OneTimePayment(
                          price: state.firstArticle.price,
                          title: state.firstArticle.title,
                          imageUrl: state.firstArticle.image.middle,
                          isJournal: false,
                          isRegistered:
                              context.read<AuthenticationBloc>().state.status == AuthenticationStatus.authenticated,
                          subtitle: state.firstArticle.redaction,
                          id: state.firstArticle.id,
                        ),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) => BuyDialog(
                        onPaymentTap: () {},
                        onRegistrationTap: () {},
                      ),
                    );
                  }
                }
              },
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 0, bottom: 16),
                    height: 188,
                    decoration:
                        BoxDecoration(border: Border.all(color: divider), borderRadius: BorderRadius.circular(8)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        imageUrl: state.firstArticle.image.middle,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.firstArticle.title,
                      style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Html(
                    data: state.firstArticle.shortDescription,
                    style: {
                      'p': Style(
                        fontSize: const FontSize(13),
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        color: textSecondary,
                      )
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
