import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comment_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentAboutHospital extends StatelessWidget {
  final CommentEntity entity;
  const CommentAboutHospital({
    required this.entity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: textFieldColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: darkerGreen.withOpacity(0.09),
            offset: const Offset(0, 8),
            blurRadius: 24,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  entity.userImage.middle,
                  height: 36,
                  width: 36,
                  errorBuilder: (_, __, ___) => Container(
                    color: textFieldColor,
                    height: 36,
                    width: 36,
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
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entity.userFullName,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 15),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.star,
                        height: 12,
                        width: 12,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        entity.rating.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: darkGreen),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          Text(
            entity.comment,
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 13),
          )
        ],
      ),
    );
  }
}
