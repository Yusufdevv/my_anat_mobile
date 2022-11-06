import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllHospitalItemsScreen extends StatelessWidget {
  final String appbarTitle;
  final Widget child;
  const AllHospitalItemsScreen(
      {required this.appbarTitle, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textFieldColor,
      appBar: AppBar(
        leading: WScaleAnimation(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: SvgPicture.asset(
              AppIcons.chevronRight,
              color: textSecondary,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 1,
        shadowColor: appBarDivider,
        leadingWidth: 56,
        title: Text(
          appbarTitle,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(fontSize: 20, color: textColor),
        ),
      ),
      body: child,
    );
  }
}
