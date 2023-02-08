import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/navigation/domain/entity/nav_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavItemWidget extends StatelessWidget {
  final int currentIndex;
  final String? avatar;
  final NavBar navBar;

  const NavItemWidget({
    this.avatar,
    required this.navBar,
    required this.currentIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 11),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: SvgPicture.asset(
              navBar.icon,
              height: 16,
              width: 16,
              color: currentIndex == navBar.id ? primary : textSecondary,
            ),
          ),
          const SizedBox(height: 2),
          Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              navBar.title.tr(),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: currentIndex == navBar.id
                  ? Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 12, color: textColor)
                  : Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
