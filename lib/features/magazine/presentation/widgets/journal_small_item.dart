import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/domain/entities/journal_entity.dart';
import 'package:anatomica/features/magazine/presentation/bloc/download/download_bloc.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/magazine/presentation/pages/magazine_single_item.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MagazineSmallItem extends StatelessWidget {
  final JournalEntity journalEntity;
  final EdgeInsets margin;
  final VoidCallback onButtonTap;

  const MagazineSmallItem(
      {required this.journalEntity, this.margin = EdgeInsets.zero, required this.onButtonTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        Navigator.push(
          context,
          fade(
            page: MagazineSingleItem(
              downloadBloc: context.read<DownloadBloc>(),
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
                Row(
                  children: [
                    Text(
                      journalEntity.name,
                      style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            WButton(
              margin: const EdgeInsets.only(top: 12),
              onTap: onButtonTap,
              child: Text(
                journalEntity.isBought ? 'O\'qish' : MyFunctions.getFormatCostFromInt(journalEntity.price),
                style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
