import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/domain/entities/journal_entity.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/magazine/presentation/pages/onetime_payment.dart';
import 'package:anatomica/features/magazine/presentation/widgets/article_item.dart';
import 'package:anatomica/features/magazine/presentation/widgets/magazine_item.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class MagazineSingleItem extends StatelessWidget {
  final JournalBloc bloc;
  final JournalEntity journal;

  const MagazineSingleItem(
      {required this.bloc, required this.journal, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc..add(GetJournalSingleArticles(id: journal.id)),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: WScaleAnimation(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                AppIcons.chevronLeft,
                color: textSecondary,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                AppIcons.share,
                color: darkGreen,
              ),
            ),
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: const Color(0xFFF0F5F3),
                height: 1.0,
              )),
        ),
        body: BlocBuilder<JournalBloc, JournalState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: MagazineItem(
                      onLeftButtonTap: () {},
                      onRightButtonTap: () {
                        Navigator.of(context, rootNavigator: true).push(fade(
                            page: OneTimePayment(
                          price: journal.price,
                          title: journal.redaction,
                          imageUrl: journal.image.middle,
                          isJournal: false,
                          isRegistered:
                              context.read<AuthenticationBloc>().state.status ==
                                  AuthenticationStatus.authenticated,
                          subtitle: journal.redaction,
                          id: journal.id,
                        )));
                      },
                      isBuyText: true,
                      journalEntity: journal,
                      isTapDisabled: true,
                    ),
                  ),
                ),
                if (state.journalSingleArticleStatus ==
                    PaginatorStatus.PAGINATOR_SUCCESS) ...[
                  if (state.journalSingleArticles.isNotEmpty) ...{
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, bottom: 12, top: 20),
                        child: Text(
                          'Статьи из выпуска',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 18),
                        ),
                      ),
                    ),
                  },
                  SliverPadding(
                    padding: EdgeInsets.only(
                      top: 6,
                      left: 16,
                      right: 16,
                      bottom: MediaQuery.of(context).padding.bottom,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ArticleItem(
                            margin: const EdgeInsets.only(bottom: 12),
                            magazineItemEntity:
                                state.journalSingleArticles[index],
                          );
                        },
                        childCount: state
                            .journalSingleArticles.length, // 1000 list items
                      ),
                    ),
                  )
                ] else if (state.journalSingleArticleStatus ==
                    PaginatorStatus.PAGINATOR_LOADING) ...{
                  const SliverToBoxAdapter(
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  )
                } else if (state.journalSingleArticleStatus ==
                    PaginatorStatus.PAGINATOR_ERROR) ...{
                  const SliverToBoxAdapter(
                    child: Center(
                      child: Text('Error'),
                    ),
                  ),
                }
              ],
            );
          },
        ),
      ),
    );
  }
}
