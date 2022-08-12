import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  const AuthHeader({
    this.title = '',
    this.subTitle = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppIcons.logo),
          const SizedBox(height: 36),
          Text(title,
              style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 28, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
