import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationItem extends StatelessWidget {
  final VoidCallback onDetailsTap;
  final String time;
  final String title;
  final bool isRead;
  const NotificationItem(
      {Key? key,
      required this.isRead,
      required this.time,
      required this.title,
      required this.onDetailsTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isRead ? primary : textFieldColor),
      ),
      padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
      child: Row(
        children: [
          if (isRead) ...{
            Container(
              width: 4,
              height: 32,
              decoration: const BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
            )
          },
          SizedBox(width: isRead ? 16 : 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 12),
                WScaleAnimation(
                  onTap: onDetailsTap,
                  child: Row(
                    children: [
                      Text(
                        LocaleKeys.go.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 14),
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset(AppIcons.arrowRight, color: primary)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
