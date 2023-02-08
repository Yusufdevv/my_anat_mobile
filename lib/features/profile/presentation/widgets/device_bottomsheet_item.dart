import 'package:flutter/material.dart';

class DeviceBottomSheetItem extends StatelessWidget {
  final String title;
  final String subTitle;

  const DeviceBottomSheetItem({this.title = '', this.subTitle = '', Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            subTitle,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
          )
        ],
      ),
    );
  }
}
