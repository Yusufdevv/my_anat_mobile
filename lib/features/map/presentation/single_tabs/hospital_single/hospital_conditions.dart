import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HospitalConditions extends StatelessWidget {
  const HospitalConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, mainAxisExtent: 102),
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppIcons.smile,
            ),
            const Spacer(),
            Text(
              'Вежливый персонал',
              style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14),
            )
          ],
        ),
      ),
      itemCount: 20,
    );
  }
}
