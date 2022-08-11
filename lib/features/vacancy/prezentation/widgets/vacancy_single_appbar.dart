import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VacancySingleAppBar extends StatelessWidget {
  const VacancySingleAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: false,
      stretch: false,
      toolbarHeight: 0,
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: Colors.red,
      expandedHeight: 60,
      title: const SizedBox(),
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Container(
          padding: EdgeInsets.fromLTRB(16, 16 + mediaQuery.padding.top, 16, 16),
          height: 60,
          decoration: BoxDecoration(
            color: primary,
            boxShadow: [
              BoxShadow(
                  color: woodSmoke.withOpacity(0.12), offset: const Offset(0, 8), blurRadius: 24)
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  WScaleAnimation(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset(AppIcons.chevronLeft)),
                  const Spacer(),
                  Text('Вакансии', style: Theme.of(context).textTheme.headline2),
                  const Spacer(),
                  SvgPicture.asset(AppIcons.vacancySingleStar),
                  const SizedBox(width: 20),
                  SvgPicture.asset(AppIcons.share),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
