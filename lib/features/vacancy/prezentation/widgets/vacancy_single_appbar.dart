import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/favourite_button_vacancy.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class VacancySingleAppBar extends StatelessWidget {
  final String shareValue;
  final VacancyListEntity vacancy;

  const VacancySingleAppBar({required this.shareValue, required this.vacancy, Key? key}) : super(key: key);

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
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: primary,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: white,
      ),
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
            boxShadow: [BoxShadow(color: woodSmoke.withOpacity(0.12), offset: const Offset(0, 8), blurRadius: 24)],
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(LocaleKeys.vacancy.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Row(
                    children: [
                      WScaleAnimation(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SvgPicture.asset(AppIcons.chevronLeft)),
                      const Spacer(),
                      FavouriteButtonVacancy(
                        vacancy: vacancy,
                        activeColor: white,
                        inactiveColor: white,
                      ),
                      const SizedBox(width: 20),
                      WScaleAnimation(
                        onTap: () {
                          Share.share(shareValue);
                        },
                        child: SvgPicture.asset(AppIcons.share),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
