import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/auth/presentation/pages/register.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/journal/domain/entities/journal_entity.dart';
import 'package:anatomica/features/journal/presentation/bloc/download/download_bloc.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/journal/presentation/pages/payment_screen.dart';
import 'package:anatomica/features/journal/presentation/widgets/article_item.dart';
import 'package:anatomica/features/journal/presentation/widgets/buy_dialog.dart';
import 'package:anatomica/features/journal/presentation/widgets/journal_single_big_item.dart';
import 'package:anatomica/features/markdown_reader/presentation/pages/journal_markdown_reader.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:share_plus/share_plus.dart';

class JournalSingleScreen extends StatefulWidget {
  final JournalBloc bloc;
  final DownloadBloc downloadBloc;
  final JournalEntity journal;

  const JournalSingleScreen({required this.bloc, required this.journal, required this.downloadBloc, Key? key})
      : super(key: key);

  @override
  State<JournalSingleScreen> createState() => _JournalSingleScreenState();
}

class _JournalSingleScreenState extends State<JournalSingleScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: widget.bloc
            ..add(GetJournalSingleArticles(id: widget.journal.id))
            ..add(GetJournalSingle(slug: widget.journal.slug)),
        ),
        BlocProvider.value(
          value: widget.downloadBloc..add(CheckWhetherFileAlreadyDownloaded(id: widget.journal.id)),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: white, statusBarIconBrightness: Brightness.dark),
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
            WScaleAnimation(
              onTap: () {
                Share.share('https://anatomica.uz/journal/${widget.journal.slug}');
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  AppIcons.share,
                  color: darkGreen,
                ),
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
            if (state.getJournalSingleStatus.isSubmissionInProgress) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state.getJournalSingleStatus.isSubmissionSuccess) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: BlocBuilder<DownloadBloc, DownloadState>(
                        builder: (context, downloadState) {
                          return JournalSingleBigItem(
                            onTap: () {
                              Navigator.of(context).push(
                                fade(
                                  page: JournalMarkdownPageReader(
                                    title: widget.journal.redaction,
                                    slug: widget.journal.slug,
                                  ),
                                ),
                              );
                            },
                            onLeftButtonTap: () {
                              Navigator.of(context).push(
                                fade(
                                  page: JournalMarkdownPageReader(
                                    title: widget.journal.redaction,
                                    slug: widget.journal.slug,
                                    isPreview: true,
                                  ),
                                ),
                              );
                            },
                            onRightButtonTap: () {
                              if (widget.journal.isBought || !widget.journal.isPremium) {
                                Navigator.of(context).push(fade(
                                    page: JournalMarkdownPageReader(
                                  title: widget.journal.redaction,
                                  slug: widget.journal.slug,
                                )));
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => BuyDialog(
                                    onPaymentTap: () {
                                      Navigator.of(context, rootNavigator: true).push(
                                        fade(
                                          page: PaymentScreen(
                                            price: state.journalSingle.price,
                                            title: state.journalSingle.redaction,
                                            imageUrl: state.journalSingle.image.middle,
                                            isJournal: true,
                                            isRegistered: context.read<AuthenticationBloc>().state.status ==
                                                AuthenticationStatus.authenticated,
                                            subtitle: state.journalSingle.redaction,
                                            id: state.journalSingle.id,
                                          ),
                                        ),
                                      );
                                    },
                                    onRegistrationTap: () {
                                      Navigator.of(context).push(fade(page: const RegisterScreen()));
                                    },
                                  ),
                                );
                              }
                            },
                            journalEntity: widget.journal,
                            isDownloaded: !widget.journal.isPremium || widget.journal.isBought,
                          );
                        },
                      ),
                    ),
                  ),
                  if (state.journalSingleArticleStatus == PaginatorStatus.PAGINATOR_SUCCESS) ...[
                    if (state.journalSingleArticles.isNotEmpty) ...{
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 12, top: 20),
                          child: Text(
                            LocaleKeys.article_issue.tr(),
                            style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
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
                              magazineItemEntity: state.journalSingleArticles[index],
                            );
                          },
                          childCount: state.journalSingleArticles.length, // 1000 list items
                        ),
                      ),
                    )
                  ] else if (state.journalSingleArticleStatus == PaginatorStatus.PAGINATOR_LOADING) ...{
                    const SliverToBoxAdapter(
                      child: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    )
                  } else if (state.journalSingleArticleStatus == PaginatorStatus.PAGINATOR_ERROR) ...{
                    const SliverToBoxAdapter(
                      child: Center(
                        child: Text('Error'),
                      ),
                    ),
                  }
                ],
              );
            } else if (state.getJournalSingleStatus.isSubmissionFailure) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
