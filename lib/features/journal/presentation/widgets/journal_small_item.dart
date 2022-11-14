import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/journal/domain/entities/journal_entity.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/journal/presentation/pages/journal_single_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MagazineSmallItem extends StatelessWidget {
  final JournalEntity journalEntity;
  final EdgeInsets margin;

  const MagazineSmallItem({required this.journalEntity, this.margin = EdgeInsets.zero, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          fade(
            page: JournalSingleScreen(
              journal: journalEntity,
              bloc: context.read<JournalBloc>(),
            ),
          ),
        );
      },
      child: Container(
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
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 8),
                if (!(journalEntity.isBought || !journalEntity.isPremium)) ...{
                  Row(
                    children: [
                      Text(
                        MyFunctions.getFormatCostFromInt(journalEntity.price),
                        style:
                            Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                } else ...{
                  const SizedBox(height: 16)
                }
              ],
            ),
            WButton(
              margin: const EdgeInsets.only(top: 12),
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  fade(
                    page: JournalSingleScreen(
                      journal: journalEntity,
                      bloc: context.read<JournalBloc>(),
                    ),
                  ),
                );
              },
              child: Text(
                LocaleKeys.journal_more.tr(),
                style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
