import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comfort_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConditionItem extends StatelessWidget {
  final ComfortEntity entity;

  const ConditionItem({required this.entity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: textFieldColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.network(
            entity.icon.file.url,
            color: primary,
            width: 24,
            height: 24,
          ),
          Text(
            entity.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14),
          )
        ],
      ),
    );
  }
}
