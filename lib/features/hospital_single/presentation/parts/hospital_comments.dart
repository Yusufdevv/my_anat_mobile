import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/rating_container.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/map/presentation/widgets/comment_bottom_sheet.dart';
import 'package:anatomica/features/map/presentation/widgets/comment_item.dart';
import 'package:flutter/material.dart';

class HospitalComments extends StatelessWidget {
  const HospitalComments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: white,
            border: Border(
              bottom: BorderSide(color: textFieldColor),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                '4,0',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: textSecondary,
                      fontSize: 40,
                    ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RatingStars(
                      rate: 4,
                      inactiveStarColor: primary.withOpacity(0.5),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '7 отзывов',
                      style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: WButton(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (_) => CommentBottomSheet(parentContext: context),
                    );
                  },
                  text: 'Добавить отзыв',
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) => const CommentItem(),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
