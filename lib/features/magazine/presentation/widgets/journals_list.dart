import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/magazine/presentation/bloc/download/download_bloc.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/magazine/presentation/pages/onetime_payment.dart';
import 'package:anatomica/features/magazine/presentation/widgets/downloading_dialog.dart';
import 'package:anatomica/features/magazine/presentation/widgets/journal_small_item.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munir_epub_reader/epub_viewer.dart';

class JournalsList extends StatelessWidget {
  final JournalState state;
  const JournalsList({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 20,
          mainAxisExtent: 370,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final journal = state.journals.skip(1).take(4).toList()[index];
            return MagazineSmallItem(
              onTap: () {
                print(journal.isBought);
                if (journal.isBought) {
                  context.read<DownloadBloc>().add(
                        CheckWetherFileExists(
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
                                child: DownloadingDialog(bookTitle: 'widget.book.title', parentContext: context),
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
                      page: OneTimePayment(
                        price: journal.price,
                        title: journal.redaction,
                        imageUrl: journal.image.middle,
                        isJournal: false,
                        isRegistered:
                            context.read<AuthenticationBloc>().state.status == AuthenticationStatus.authenticated,
                        subtitle: journal.redaction,
                        id: journal.id,
                      ),
                    ),
                  );
                }
              },
              margin: const EdgeInsets.only(top: 20),
              journalEntity: state.journals.skip(1).take(4).toList()[index],
            );
          },
          childCount: state.journals.skip(1).take(4).length,
        ),
      ),
    );
  }
}
