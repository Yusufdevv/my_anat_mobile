import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/profile/prezentation/widgets/device_bottomsheet.dart';
import 'package:anatomica/features/profile/prezentation/widgets/device_item.dart';
import 'package:flutter/material.dart';

class ActiveDevicesScreen extends StatelessWidget {
  ActiveDevicesScreen({Key? key}) : super(key: key);
  List<String> titleList = ['Macbook Pro', 'Iphone 14 Pro max'];
  List<String> subTitle = ['Web Application v.2.3', 'Anatomica App v.2.1 (iOS)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WAppBar(title: 'Активные устройства', hasUnderline: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Нынышнее устройство',
                style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 14)),
            DeviceItem(onTap: () {
              showDeviceBottomSheet(context);
            }),
            const SizedBox(height: 4),
            const WDivider(),
            const SizedBox(height: 16),
            Text('Другие сессии',
                style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 14)),
            const SizedBox(height: 8),
            ...List.generate(
              2,
              (index) => DeviceItem(
                color: whiteIce,
                iconColor: primary,
                icon: index == 0 ? AppIcons.deviceLaptop : AppIcons.mobileDevice,
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
