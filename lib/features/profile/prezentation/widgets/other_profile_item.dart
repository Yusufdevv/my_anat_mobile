import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtherProfileItem extends StatelessWidget {
  final Color? backgroundColor;
  final String? title;
  final Color? iconBackgroundColor;
  final String? icon;

  const OtherProfileItem(
      {this.icon, this.title, this.backgroundColor, this.iconBackgroundColor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor ?? frostedMint,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: iconBackgroundColor ?? mediumSeaGreen,
            ),
            child: SvgPicture.asset(icon ?? AppIcons.medicalDoctor),
          ),
          const SizedBox(width: 12),
          Text(
            title ?? 'Получить профиль врача',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
          )
        ],
      ),
    );
  }
}
