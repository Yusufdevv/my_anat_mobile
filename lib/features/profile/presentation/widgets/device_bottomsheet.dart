import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/profile/presentation/widgets/device_bottomsheet_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeviceBottomSheet extends StatelessWidget {
  DeviceBottomSheet({Key? key}) : super(key: key);
  final List<String> titleList = ['IP адресс:', 'Локация:', 'Дата входа в аккаунт', 'Последняя сессия:'];
  final List<String> subTitle = [
    '912385141',
    'Tashkent, Uzbekistan',
    'Январь 12, 2022; 23:23:23',
    'Июль 2, 2022; 15:19:03',
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return WBottomSheet(
      contentPadding: EdgeInsets.fromLTRB(16, 34, 16, 12 + mediaQuery.padding.bottom),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: whiteIce,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(AppIcons.deviceLaptop, height: 40, width: 40),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Macbook Pro',
              style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Web Application v.2.3',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 14,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        ...List.generate(
          titleList.length,
          (index) => DeviceBottomSheetItem(
            title: titleList[index],
            subTitle: subTitle[index],
          ),
        ),
        const SizedBox(height: 24),
        WButton(
          text: LocaleKeys.sing_out_device.tr(),
          onTap: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}

void showDeviceBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    builder: (context) => DeviceBottomSheet(),
  );
}
