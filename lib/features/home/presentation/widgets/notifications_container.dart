import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
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
      padding: EdgeInsets.symmetric(horizontal: isRead ? 12 : 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isRead ? primary : textFieldColor),
      ),
      child: Row(
        children: [
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
          ),
          Column(
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
                      'Перейти',
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
        ],
      ),
    );
  }
}
