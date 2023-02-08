import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: primary,
      ),
      child: Row(
        children: [
          Text(
            'До 3 000 000',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(AppIcons.cancelButton),
        ],
      ),
    );
  }
}
