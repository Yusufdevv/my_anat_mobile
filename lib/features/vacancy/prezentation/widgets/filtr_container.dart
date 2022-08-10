import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterContainer extends StatelessWidget {
  const FilterContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
        border: Border.all(width: 1, color: pattensBlue),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.filter),
          const SizedBox(width: 12),
          const Text('Фильтр'),
          const Spacer(),
          SvgPicture.asset(AppIcons.arrowRight)
        ],
      ),
    );
  }
}
