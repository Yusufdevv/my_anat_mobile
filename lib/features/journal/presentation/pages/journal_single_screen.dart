import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/journal/domain/entities/journal_entity.dart';
import 'package:anatomica/features/journal/presentation/bloc/download/download_bloc.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/journal/presentation/pages/payment_screen.dart';
import 'package:anatomica/features/journal/presentation/widgets/article_item.dart';
import 'package:anatomica/features/journal/presentation/widgets/downloading_dialog.dart';
import 'package:anatomica/features/journal/presentation/widgets/journal_single_big_item.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:munir_epub_reader/epub_viewer.dart';
import 'package:share_plus/share_plus.dart';

class JournalSingleScreen extends StatelessWidget {
  final JournalBloc bloc;
  final DownloadBloc downloadBloc;
  final JournalEntity journal;

  const JournalSingleScreen({required this.bloc, required this.journal, required this.downloadBloc, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: bloc
            ..add(GetJournalSingleArticles(id: journal.id))
            ..add(GetJournalSingle(slug: journal.slug)),
        ),
        BlocProvider.value(
          value: downloadBloc..add(CheckWhetherFileAlreadyDownloaded(id: journal.id)),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: white),
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
                Share.share('https://anatomica.uz/journal/${journal.slug}');
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
                            onLeftButtonTap: () {
                              context.read<DownloadBloc>().add(
                                    CheckWhetherFragmentFileExists(
                                      fileName: journal.redaction,
                                      fileUrl: state.journalSingle.preview.url,
                                      id: journal.id,
                                      onNotDownloaded: () async {
                                        SystemChrome.setSystemUIOverlayStyle(
                                            const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
                                        await showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          barrierColor: primary.withOpacity(0.84),
                                          builder: (_) => BlocProvider.value(
                                            value: context.read<DownloadBloc>(),
                                            child: DownloadingDialog(
                                                bookTitle: 'widget.book.title', parentContext: context),
                                          ),
                                        );
                                      },
                                      fileType: journal.fileExtension,
                                      onDownloaded: (file) {
                                        EpubViewer.open(file.path);
                                      },
                                    ),
                                  );
                            },
                            onRightButtonTap: () {
                              if (journal.isBought || !journal.isPremium) {
                                context.read<DownloadBloc>().add(
                                      CheckWhetherFileExists(
                                        slug: journal.slug,
                                        filename: journal.name,
                                        id: journal.id,
                                        onNotDownloaded: () async {
                                          SystemChrome.setSystemUIOverlayStyle(
                                              const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
                                          await showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            barrierColor: primary.withOpacity(0.84),
                                            builder: (_) => BlocProvider.value(
                                              value: context.read<DownloadBloc>(),
                                              child: DownloadingDialog(
                                                  bookTitle: 'widget.book.title', parentContext: context),
                                            ),
                                          );
                                        },
                                        fileType: journal.fileExtension,
                                        onDownloaded: (file) {
                                          print(file.path);
                                          // final encryptor = EncryptorRepository(iv: 'iv', key: '${journal.id}hC2uG1dQ8tK5nS1q');
                                          // final decryptedFile = encryptor.getDecryptedDAta(file.readAsBytesSync());
                                          EpubViewer.open(file.path);
                                        },
                                      ),
                                    );
                              } else {
                                Navigator.of(context, rootNavigator: true).push(
                                  fade(
                                    page: PaymentScreen(
                                      price: journal.price,
                                      title: journal.redaction,
                                      imageUrl: journal.image.middle,
                                      isJournal: true,
                                      isRegistered: context.read<AuthenticationBloc>().state.status ==
                                          AuthenticationStatus.authenticated,
                                      subtitle: journal.redaction,
                                      id: journal.id,
                                    ),
                                  ),
                                );
                              }
                            },
                            journalEntity: journal,
                            isDownloaded: downloadState.isFileAlreadyDownloaded,
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
