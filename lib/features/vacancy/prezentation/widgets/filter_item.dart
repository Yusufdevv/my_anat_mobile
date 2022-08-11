import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 11, 16, 13),
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: lilyWhite),
      ),
      child: Row(
        children: [
          Text(
            'Зарплата',
            style: Theme.of(context).textTheme.headline1!.copyWith(),
          ),
          const Spacer(),
          SvgPicture.asset(AppIcons.arrowRight),
        ],
      ),
    );
  }
}
