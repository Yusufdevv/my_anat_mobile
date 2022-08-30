import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class CommentEmpty extends StatelessWidget {
  const CommentEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16).copyWith(bottom: 16 + MediaQuery.of(context).padding.bottom),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppIcons.commentEmpty),
          Text(
            LocaleKeys.no_reviews.tr(),
            style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 8),
          Text(
            LocaleKeys.write_reviews.tr(),
            style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          WButton(
            onTap: () {},
            text: LocaleKeys.add_reviews.tr(),
          ),
        ],
      ),
    );
  }
}
