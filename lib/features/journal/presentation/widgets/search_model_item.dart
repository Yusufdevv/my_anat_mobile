import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/highlighted_text.dart';
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
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchedModelsItem extends StatelessWidget {
  final TextEditingController controller;
  final JournalEntity magazineItemEntity;

  const SearchedModelsItem({required this.controller, required this.magazineItemEntity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: divider), borderRadius: BorderRadius.circular(8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: magazineItemEntity.image.middle,
                fit: BoxFit.cover,
                height: 232,
                width: 164,
              ),
            ),
          ),
          const SizedBox(height: 12),
          HighlightedText(
            textStyleHighlight:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 13, fontWeight: FontWeight.w600),
            textStyle: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 13, fontWeight: FontWeight.w600),
            allText: magazineItemEntity.redaction,
            highlightedText: controller.text,
            highlightColor: yellowHighlightedText,
          ),
          const SizedBox(height: 4),
          Text(
            MyFunctions.getFormatCostFromInt(magazineItemEntity.price),
            style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13, fontWeight: FontWeight.w400),
          ),
          WButton(
            width: 164,
            margin: const EdgeInsets.only(top: 12),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                fade(
                  page: JournalSingleScreen(
                    downloadBloc: context.read<DownloadBloc>(),
                    journal: magazineItemEntity,
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
      );
}
