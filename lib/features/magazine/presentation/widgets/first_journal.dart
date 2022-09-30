import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/register_bottom_sheet.dart';
import 'package:anatomica/features/magazine/presentation/bloc/download/download_bloc.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/magazine/presentation/pages/all_journals_screen.dart';
import 'package:anatomica/features/magazine/presentation/pages/buy_subscription.dart';
import 'package:anatomica/features/magazine/presentation/pages/onetime_payment.dart';
import 'package:anatomica/features/magazine/presentation/widgets/downloading_dialog.dart';
import 'package:anatomica/features/magazine/presentation/widgets/journal_item.dart';
import 'package:anatomica/features/magazine/presentation/widgets/title_with_suffix_action.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munir_epub_reader/epub_viewer.dart';

class FirstJournal extends StatelessWidget {
  final JournalState state;

  const FirstJournal({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          children: [
            TitleWithSuffixAction(
              title: LocaleKeys.issues.tr(),
              onTap: () {
                Navigator.of(context).push(
                  fade(
                    page: AllJournalsScreen(
                      bloc: context.read<JournalBloc>(),
                    ),
                  ),
                );
              },
            ),
            MagazineItem(
              onLeftButtonTap: () async {
                if (state.journals.first.isBought) {
                  context.read<DownloadBloc>().add(
                        CheckWetherFileExists(
                          slug: state.journals.first.slug,
                          filename: state.journals.first.name,
                          id: state.journals.first.id,
                          onNotDownloaded: () async {
                            SystemChrome.setSystemUIOverlayStyle(
                                const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
                            await showDialog(
                              barrierDismissible: false,
                              context: context,
                              barrierColor: primary.withOpacity(0.84),
                              builder: (_) => BlocProvider.value(
                                value: context.read<DownloadBloc>(),
                                child: DownloadingDialog(bookTitle: 'widget.book.title', parentContext: context),
                              ),
                            );
                          },
                          fileType: state.journals.first.fileExtension,
                          onDownloaded: (file) {
                            EpubViewer.open(file.path);
                          },
                        ),
                      );
                } else {
                  Navigator.of(context, rootNavigator: true).push(
                    fade(
                      page: OneTimePayment(
                        price: state.journals.first.price,
                        title: state.journals.first.redaction,
                        imageUrl: state.journals.first.image.middle,
                        isJournal: false,
                        isRegistered:
                            context.read<AuthenticationBloc>().state.status == AuthenticationStatus.authenticated,
                        subtitle: state.journals.first.redaction,
                        id: state.journals.first.id,
                      ),
                    ),
                  );
                }
              },
              onRightButtonTap: () {
                if (context.read<AuthenticationBloc>().state.status == AuthenticationStatus.authenticated) {
                  Navigator.of(context, rootNavigator: true)
                      .push(fade(page: BuySubscription(images: state.journals.map((e) => e.image).toList())));
                } else {
                  showRegisterBottomSheet(context);
                }
              },
              margin: const EdgeInsets.only(right: 16, top: 4),
              journalEntity: state.journals.first,
            ),
          ],
        ),
      ),
    );
  }
}
