import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCardWidget extends StatelessWidget {
  const AddCardWidget({required this.onTap,Key? key}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return WButton(
      padding: const EdgeInsets.all(12),
      onTap: onTap,
      borderRadius: 10,
      color: lilyWhite,
      height: 56,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: textSecondary.withOpacity(0.16)),
            child: SvgPicture.asset(
              AppIcons.plusIcon,
              color: textSecondary,
            ),
          ),
          const SizedBox(width: 12),
          Text(LocaleKeys.add_card.tr(),
              style: Theme.of(context).textTheme.displayLarge)
        ],
      ),
    );
  }
}
