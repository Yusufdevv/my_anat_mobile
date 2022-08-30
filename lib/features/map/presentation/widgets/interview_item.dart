import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class InterviewItem extends StatelessWidget {
  const InterviewItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8).copyWith(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: textFieldColor),
        borderRadius: BorderRadius.circular(12),
        color: white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 8),
            blurRadius: 24,
            color: darkerGreen.withOpacity(0.09),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://picsum.photos/300/200',
              height: 184,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Text(
                  LocaleKeys.all_natural.tr(),
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.interviewTime),
                    const SizedBox(width: 4),
                    Text(
                      '1:18:30',
                      style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
