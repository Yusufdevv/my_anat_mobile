import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/journal/domain/entities/journal_entity.dart';
import 'package:anatomica/features/journal/presentation/bloc/download/download_bloc.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/journal/presentation/pages/journal_single_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JournalBigItem extends StatelessWidget {
  final JournalEntity journalEntity;
  const JournalBigItem({required this.journalEntity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
            fade(
              page: JournalSingleScreen(
                journal: journalEntity,
                bloc: context.read<JournalBloc>(),
                downloadBloc: context.read<DownloadBloc>(),
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 492,
                    decoration:
                        BoxDecoration(border: Border.all(color: divider), borderRadius: BorderRadius.circular(8)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        imageUrl: journalEntity.image.middle,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: black.withOpacity(0.4),
                      ),
                      child: Text(
                        MyFunctions.getPublishedDate(journalEntity.publishDate),
                        style:
                            Theme.of(context).textTheme.headline2!.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(journalEntity.redaction,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    MyFunctions.getFormatCostFromInt(journalEntity.price),
                    style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '•',
                    style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    LocaleKeys.e_magazine.tr(),
                    style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              WButton(
                borderRadius: 6,
                margin: const EdgeInsets.only(top: 12),
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    fade(
                      page: JournalSingleScreen(
                        journal: journalEntity,
                        bloc: context.read<JournalBloc>(),
                        downloadBloc: context.read<DownloadBloc>(),
                      ),
                    ),
                  );
                },
                child: Text(
                  LocaleKeys.journal_more.tr(),
                  style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
