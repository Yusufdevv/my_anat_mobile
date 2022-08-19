import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/profile/prezentation/pages/my_info.dart';
import 'package:anatomica/features/profile/prezentation/widgets/profile_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(fade(page: const MyInfoScreen()));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: white,
          border: Border.all(width: 1, color: persianIndigo),
          boxShadow: [
            BoxShadow(
              color: darkerGreen.withOpacity(0.09),
              offset: const Offset(0, 8),
              blurRadius: 24,
            )
          ],
        ),
        child: Row(
          children: [
            const ProfileImage(height: 48, width: 48),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Иргашев Дильмурад Саатович',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline1,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            SvgPicture.asset(
              AppIcons.arrowRight,
              height: 20,
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
