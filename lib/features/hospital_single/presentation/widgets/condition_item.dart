import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comfort_entity.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConditionItem extends StatelessWidget {
  final ComfortEntity entity;

  const ConditionItem({required this.entity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.network(
              entity.icon,
            ),
            const Spacer(),
            Text(
              entity.text,
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14),
            )
          ],
        ),
      );
}