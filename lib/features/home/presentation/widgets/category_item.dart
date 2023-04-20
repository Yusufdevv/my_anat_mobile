import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItem extends StatelessWidget {
  final String logo;
  final String title;
  final VoidCallback onTap;
  bool isGreen;
  CategoryItem(
      {required this.title,
      required this.logo,
      required this.onTap,
      this.isGreen = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: textFieldColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        height: 77,
        width: (MediaQuery.of(context).size.width - 48) / 3,
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo.contains('http')
                ? SvgPicture.network(
                    logo,
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                    color: isGreen ? primary : textSecondary,
                  )
                : SvgPicture.asset(
                    logo.isEmpty ? AppIcons.moreVertical : logo,
                    width: 24,
                    height: 24,
                    color: isGreen ? primary : textSecondary,
                    fit: BoxFit.cover,
                  ),
            const SizedBox(height: 6),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
