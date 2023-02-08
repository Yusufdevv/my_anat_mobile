import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/journal/domain/entities/journal_entity.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JournalSingleBigItem extends StatelessWidget {
  final JournalEntity journalEntity;
  final VoidCallback onLeftButtonTap;
  final VoidCallback onRightButtonTap;
  final bool isDownloaded;
  final VoidCallback? onTap;
  const JournalSingleBigItem({
    required this.journalEntity,
    required this.onLeftButtonTap,
    required this.onRightButtonTap,
    required this.isDownloaded,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 492,
                  decoration: BoxDecoration(
                      border: Border.all(color: divider),
                      borderRadius: BorderRadius.circular(8)),
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
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(journalEntity.redaction,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )),
            const SizedBox(height: 8),
            Row(
              children: [
                if (!(!journalEntity.isPremium || journalEntity.isBought)) ...[
                  Text(
                    MyFunctions.getFormatCostFromInt(journalEntity.price),
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '•',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 4),
                ],
                Text(
                  LocaleKeys.e_magazine.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
        if (isDownloaded) ...{
          WButton(
            margin: const EdgeInsets.only(top: 12),
            onTap: onTap ?? () {},
            text: LocaleKeys.read.tr(),
          )
        } else ...{
          Row(
            children: [
              Expanded(
                child: WButton(
                  border: Border.all(color: primary),
                  color: unFollowButton,
                  margin: const EdgeInsets.only(top: 12),
                  onTap: onLeftButtonTap,
                  child: Text(
                    LocaleKeys.preview.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: WButton(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.only(top: 12),
                  onTap: onRightButtonTap,
                  child: journalEntity.isBought
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.download),
                            const SizedBox(width: 8),
                            Text(
                              LocaleKeys.download.tr(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      : Text(
                          journalEntity.isBought || !journalEntity.isPremium
                              ? LocaleKeys.read.tr()
                              : LocaleKeys.buy.tr(args: [
                                  MyFunctions.getFormatCostFromInt(
                                      journalEntity.price)
                                ]),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                ),
              ),
            ],
          )
        }
      ],
    );
  }
}
