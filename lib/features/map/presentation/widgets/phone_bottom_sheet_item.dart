import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/map/presentation/widgets/contact_item.dart';
import 'package:flutter/material.dart';

class PhoneBottomSheetItem extends StatelessWidget {
  final String phone;

  const PhoneBottomSheetItem({
    this.phone = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: textFieldColor),
          color: white,
          boxShadow: [
            BoxShadow(
              color: darkerGreen.withOpacity(0.09),
              offset: const Offset(0, 8),
              blurRadius: 24,
            )
          ],
        ),
        child:  ContactItem(
          icon: AppIcons.boldPhone,
          content: phone,
          isLast: true,
        ),
      ),
    );
  }
}
