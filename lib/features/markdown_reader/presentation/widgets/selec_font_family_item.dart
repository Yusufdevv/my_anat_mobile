import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';

class SelectFontFamilyItem extends StatelessWidget {
  final String fontFamily;
  final VoidCallback onTap;
  final bool isSelected;
  const SelectFontFamilyItem({
    required this.fontFamily,
    required this.onTap,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 60,
              width: 60,
              margin: const EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                border: Border.all(color: divider),
                borderRadius: BorderRadius.circular(4),
                color: isSelected ? primary : white,
              ),
              alignment: Alignment.center,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: fontFamily,
                  color: isSelected ? white : textSecondary,
                ),
                child: const Text(
                  'A',
                ),
              ),
            ),
            Text(
              fontFamily,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                fontFamily: 'OpenSans',
                color: primary,
              ),
            ),
          ],
        ),
      );
}
