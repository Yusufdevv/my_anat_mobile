import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/rating_container.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/map/presentation/widgets/delete_comment_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentItem extends StatelessWidget {
  final bool isMe;

  const CommentItem({
    this.isMe = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: white,
        boxShadow: [
          BoxShadow(
            color: darkerGreen.withOpacity(0.09),
            offset: const Offset(0, 8),
            blurRadius: 24,
          )
        ],
        border: Border.all(color: textFieldColor),
      ),
      child: Column(
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
                        border: isMe ? Border.all(color: primary) : null,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://picsum.photos/200',
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
                            text: 'Шохрух Бахтияров',
                            children: [
                              if (isMe) ...{
                                TextSpan(
                                  text: ' (я)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                                ),
                              }
                            ],
                          ),
                          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 15),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(AppIcons.mapCalendar),
                            const SizedBox(width: 6),
                            Text(
                              '21 Января, 2022',
                              style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (isMe) ...{
                WScaleAnimation(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => const DeleteCommentDialog(),
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
                '3.5',
                style: Theme.of(context).textTheme.headline3!.copyWith(color: primary),
              ),
              const SizedBox(width: 8),
              const RatingStars(
                rate: 4,
                inactiveStarColor: inactiveStar,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              'Врачей не хватает. Неврапотологу, кардиологу и эндокринологу не пробиться постоянная очередь. Кровь на гепатит В и С не берут отправляют в платные мед.центры. Постоянная толпа пациентов как не подхватить вирус.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }
}
