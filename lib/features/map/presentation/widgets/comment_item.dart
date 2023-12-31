import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/rating_container.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comment_entity.dart';
import 'package:anatomica/features/map/presentation/widgets/delete_comment_dialog.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentItem extends StatelessWidget {
  final CommentEntity entity;
  final bool isMainScreen;
  final VoidCallback? onTapDelete;
  final bool hasShadow;
  final bool isOrganization;

  const CommentItem({
    required this.entity,
    this.isMainScreen = false,
    this.onTapDelete,
    this.hasShadow = true,
    this.isOrganization = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: white,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: darkerGreen.withOpacity(0.09),
                  offset: const Offset(0, 8),
                  blurRadius: 24,
                )
              ]
            : [],
        border: Border.all(color: textFieldColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border:
                            entity.isOwn ? Border.all(color: primary) : null,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          entity.userImage.middle,
                          errorBuilder: (context, object, stack) => Container(
                            height: 40,
                            width: 40,
                            color: textFieldColor,
                            alignment: Alignment.center,
                            child: Text(
                              entity.userFullName.isNotEmpty
                                  ? entity.userFullName[0]
                                  : '',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(color: textSecondary, fontSize: 15),
                            ),
                          ),
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: isOrganization
                                ? entity.userFullName
                                : entity.fullName,
                            children: [
                              if (entity.isOwn) ...{
                                TextSpan(
                                  text: LocaleKeys.me.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                ),
                              }
                            ],
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 15),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(AppIcons.mapCalendar),
                            const SizedBox(width: 6),
                            Text(
                              MyFunctions.getPublishedDate(entity.createdAt),
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (entity.isOwn) ...{
                WScaleAnimation(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) =>
                          DeleteCommentDialog(onTapDelete: onTapDelete),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(AppIcons.delete),
                  ),
                )
              }
            ],
          ),
          const Divider(
            height: 32,
            thickness: 1,
            color: textFieldColor,
          ),
          Row(
            children: [
              Text(
                entity.rating.toString(),
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: primary),
              ),
              const SizedBox(width: 8),
              RatingStars(
                rate: entity.rating,
                inactiveStarColor: inactiveStar,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              entity.comment,
              maxLines: isMainScreen ? 2 : null,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }
}
