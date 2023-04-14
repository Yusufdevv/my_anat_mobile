import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyWidget extends StatelessWidget {
  final VoidCallback? onButtonTap;
  final String? title;
  final String? content;
  final bool hasMargin;
  final bool hasPadding;
  final Color backColor;
  const EmptyWidget({
    this.onButtonTap,
    this.title,
    this.content,
    this.hasMargin = true,
    this.hasPadding = true,
    this.backColor = white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: hasMargin
          ? const EdgeInsets.all(16)
              .copyWith(bottom: 16 + MediaQuery.of(context).padding.bottom)
          : null,
      padding: hasPadding
          ? const EdgeInsets.symmetric(vertical: 24, horizontal: 16)
          : null,
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppIcons.emptyA),
          const SizedBox(height: 16),
          Text(
            title ?? LocaleKeys.no_reviews.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 20),
          ),
          const SizedBox(height: 8),
          Text(
            content ?? LocaleKeys.write_reviews.tr(),
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          if (onButtonTap != null) ...[
            const SizedBox(height: 24),
            WButton(
              onTap: onButtonTap ?? () {},
              text: LocaleKeys.add_reviews.tr(),
            ),
          ]
        ],
      ),
    );
  }
}
