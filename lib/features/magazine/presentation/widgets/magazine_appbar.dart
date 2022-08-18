import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/presentation/pages/magazine_search_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MagazineAppBar extends StatelessWidget {
  const MagazineAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: woodSmoke.withOpacity(0.12),
            blurRadius: 24,
            offset: const Offset(0, 8),
          )
        ],
      ),
      padding: EdgeInsets.fromLTRB(16, 8 + mediaQuery.padding.top, 16, 16),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.mainLogo,
            height: 20,
          ),
          const Spacer(),
          WScaleAnimation(
            onTap: () {
              Navigator.of(context).push(
                fade(
                  page: const MagazineSearchScreen(
                      // controller: TextEditingController(),
                      // magazineItemEntity: MagazineItemEntity(
                      //     date: 'Май 2022',
                      //     authorName: 'Джамшид Мукимов',
                      //     title: '',
                      //     imageUrl:
                      //         'https://images.unsplash.com/photo-1660238427916-7255265c6a6b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                      //     today: '',
                      //     price: 0),
                      ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: lilyWhite,
              ),
              child: Center(
                child: SvgPicture.asset(AppIcons.magazineSearch),
              ),
            ),
          ),
          WScaleAnimation(
            onTap: () {},
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: lilyWhite,
              ),
              child: Center(
                child: SvgPicture.asset(AppIcons.magazineFilter),
              ),
            ),
          )
        ],
      ),
    );
  }
}
