import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/map/presentation/widgets/phone_bottom_sheet_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhonesBottomSheet extends StatelessWidget {
  const PhonesBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.only(left: 16, bottom: MediaQuery.of(context).padding.bottom + 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Позвонить',
                style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
              ),
              WScaleAnimation(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: SvgPicture.asset(
                    AppIcons.bottomSheetCancel,
                    height: 28,
                  ),
                ),
              )
            ],
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: textFieldColor,
          ),
          ListView.separated(
            padding: const EdgeInsets.fromLTRB(0, 16, 16, 0),
            shrinkWrap: true,
            itemBuilder: (context, index) => const PhoneBottomSheetItem(),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: 2,
          )
        ],
      ),
    );
  }
}